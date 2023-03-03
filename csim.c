/*
Cache Lab Description: A cache simulator that parses thru input from the command
line, parses thru the trace file that it has been given in the command line
and uses those 2 pieces of information to create a simulation of a cache.

Name: William Chen
AndrewID: wchen4

*/
#include "cachelab.h"
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

typedef struct { // commandline arguments
    unsigned long s, E, b;
    bool v;
    char *inputFile;
} globalVars;

typedef struct way { // blocks within each queue that act as the different ways.
    unsigned long tag;
    bool dirtybit;
    struct way *next;
} way;

typedef struct { // a queue that acts as the sets in the cache
    way *head;
    way *tail;
    int size;
} set;

typedef struct { // arguments from the cmdline
    char operation;
    unsigned long address;
    int size;
    unsigned long tag_bit, set_index; // info abt the address
} operations;

void help() {
    printf(" -h          Print this help message and exit\n\
    -v          Verbose mode: report effects of each memory operation\n\
    -s <s>      Number of set index bits (there are 2**s sets)\n\
    -b <b>      Number of block bits (there are 2**b blocks)\n\
    -E <E>      Number of lines per set (associativity)\n\
    -t <trace>  File name of the memory trace to process\n");
}

// updates the cache with the specific line within the trace file.
void updateCache(globalVars *vars, operations *o, csim_stats_t *stats,
                 set **workingcache) {
    if (workingcache[o->set_index]->size == 0) { // if the set is empty.
        stats->misses += 1;
        way *node = calloc(sizeof(way), 1);
        workingcache[o->set_index]->head = node;
        workingcache[o->set_index]->tail = node;
        node->tag = o->tag_bit;
        node->dirtybit = false;
        workingcache[o->set_index]->size = 1;
        if (o->operation == 'S') {
            node->dirtybit = true;
        }
    } else { // if the set isn't empty
        way *node = workingcache[o->set_index]->head;
        way *prev = node;
        while (node != NULL) {             // loops thru the blocks in the set
            if (node->tag == o->tag_bit) { // if it hits
                stats->hits += 1;
                if (node == workingcache[o->set_index]->head &&
                    node != workingcache[o->set_index]->tail) {
                    // if its head and size!=0
                    workingcache[o->set_index]->head = node->next;
                    node->next = NULL;
                    workingcache[o->set_index]->tail->next = node;
                    workingcache[o->set_index]->tail = node;
                    if (o->operation == 'S') { // dirty the bit
                        node->dirtybit = true;
                    }
                } else if (node != workingcache[o->set_index]->tail) {
                    // if its not head or tail
                    prev->next = node->next;
                    node->next = NULL;
                    workingcache[o->set_index]->tail->next = node;
                    workingcache[o->set_index]->tail = node;
                    if (o->operation == 'S') { // dirty the bit
                        node->dirtybit = true;
                    }
                } else {                       // if its tail
                    if (o->operation == 'S') { // dirty the bit
                        node->dirtybit = true;
                    }
                }
                return;
            }
            prev = node;
            node = node->next;
        }
        stats->misses += 1; // it misses
        if ((unsigned long)workingcache[o->set_index]->size <
            vars->E) { // cold miss
            way *node = calloc(sizeof(way), 1);
            node->tag = o->tag_bit;
            node->dirtybit = false;
            workingcache[o->set_index]->tail->next = node;
            workingcache[o->set_index]->tail = node;
            if (o->operation == 'S') { // dirty the bit
                node->dirtybit = true;
            }
            workingcache[o->set_index]->size += 1;
        } else { // conflict miss
            stats->evictions += 1;
            way *node = calloc(sizeof(way), 1);
            node->tag = o->tag_bit;
            node->dirtybit = false;
            workingcache[o->set_index]->tail->next = node;
            workingcache[o->set_index]->tail = node;
            if (o->operation == 'S') { // dirty the bit
                node->dirtybit = true;
            }

            way *holder = workingcache[o->set_index]->head;
            workingcache[o->set_index]->head = holder->next;
            if (holder->dirtybit) { // dirtyevict occurs!
                stats->dirty_evictions += 1 << vars->b;
            }
            free(holder);
        }
    }
}

int main(int argc, char *argv[]) {
    globalVars *vars = malloc(sizeof(globalVars));
    vars->v = 0;
    int opt = 0;

    while ((opt = getopt(argc, argv, "hvs:E:b:t:")) != -1) {
        switch (opt) {
        case 'h':
            help();
            break;
        case 'v':
            vars->v = true;
            break;
        case 's':
            vars->s = (unsigned long)atoi(optarg);
            break;
        case 'E':
            vars->E = (unsigned long)atoi(optarg);
            break;
        case 'b':
            vars->b = (unsigned long)atoi(optarg);
            break;
        case 't':
            vars->inputFile = optarg;
            break;
        default:
            printf("%d", opt);
            printf("failed while parsing commandline\n");
            return 0;
        }
    }

    // initialize the cache
    operations *o = calloc(1, sizeof(operations));
    FILE *fptr = fopen(vars->inputFile, "r");
    if (fptr == NULL) {
        printf("failed to open file.\n");
        return 1;
    }
    csim_stats_t *stats = calloc(sizeof(csim_stats_t), 1);

    // initialize the cache
    set **workingcache = calloc(sizeof(set *), 1 << (vars->s));
    for (unsigned long i = 0; i < (1 << (vars->s)); i++) {
        workingcache[i] = calloc(sizeof(set), 1);
    }

    // go thru trace file line by line
    while (fscanf(fptr, "%c %lx,%d\n", &o->operation, &o->address, &o->size) >
           0) {
        o->set_index =
            (o->address & ((1 << (vars->b + vars->s)) - 1)) >> vars->b;
        o->tag_bit = o->address >> (vars->b + vars->s);
        if (vars->v) {
            printf("op: %c, address: %lx\n", o->operation, o->address);
        }
        updateCache(vars, o, stats, workingcache);
    }
    // loop thru cache find how many bytes dirty
    for (unsigned long j = 0; j < (1 << (vars->s)); j++) {
        way *node = workingcache[j]->head;
        while (node != NULL) {
            if (node->dirtybit) {
                stats->dirty_bytes += (1 << vars->b);
            }
            node = node->next;
        }
    }

    // print results
    printSummary(stats);

    // close file
    fclose(fptr);

    // free cache
    for (unsigned long k = 0; k < (1 << (vars->s)); k++) {
        way *node = workingcache[k]->head;
        while (node != NULL) {
            way *next = node->next;
            free(node);
            node = next;
        }
        free(workingcache[k]);
    }
}
