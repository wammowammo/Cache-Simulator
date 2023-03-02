/*

Name: William Chen
AndrewID: wchen4

*/
#include "cachelab.h"
#include <stdlib.h>
#include <unistd.h>
#include <getopt.h>
#include <stdio.h>

typedef struct{ //commandline arguments
    unsigned long s, E, b;
    bool v;
    char *inputFile;
} globalVars;

typedef struct nodeElement{
    unsigned long value;
    bool dirtybit;
    struct nodeElement *next;
} nodeElement_t;

typedef struct{
    nodeElement_t *head;
    int size;
    nodeElement_t *tail;
} queue;


typedef struct{ //file arguments
    char operation;
    unsigned long address;
    int size;
    unsigned long tag, set_index; //info abt the address
} operations;

void help(){
    printf(" -h          Print this help message and exit\n\
    -v          Verbose mode: report effects of each memory operation\n\
    -s <s>      Number of set index bits (there are 2**s sets)\n\
    -b <b>      Number of block bits (there are 2**b blocks)\n\
    -E <E>      Number of lines per set (associativity)\n\
    -t <trace>  File name of the memory trace to process\n");
}

void updateCache(globalVars gv, operations o){

}

int main(int argc, char* argv[]){
    globalVars *vars = malloc(sizeof(globalVars));
    vars->v = 0;
    int opt = 0;

    while((opt = getopt(argc, argv, "hvs:E:b:t:")) != -1){
        switch(opt){
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

    //initialize the cache

    operations *o = malloc(sizeof(operations));
    FILE *fptr = fopen(vars->inputFile, "r");
    if (fptr == NULL) {
        printf("failed to open file.\n");
        return 1;
    }

    while(fscanf(fptr, "%c %lx,%d\n", &o->operation, &o->address, &o->size)>0){
        printf("%c %lx,%d\n", o->operation, o->address, o->size);
    }

}
