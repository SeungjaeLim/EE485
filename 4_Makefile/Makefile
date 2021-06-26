CC = gcc
CFLAGS = -Wall -Werror -ansi -pedantic -std=c99 -D_GNU_SOURCE

OBJFILES1 = customer_manager1.o
OBJFILES2 = customer_manager2.o
OBJFILES_T = testclient.o

SOURCE1 = customer_manager1.c
SOURCE2 = customer_manager2.c
SOURCE_T = testclient.c

all: $(OBJFILES_T) $(OBJFILES1) $(OBJFILES2) 
	$(CC) $(CFLAGS) -o testclient1 $(SOURCE_T) $(SOURCE1)
	$(CC) $(CFLAGS) -o testclient2 $(SOURCE_T) $(SOURCE2)

array: $(OBJFILES_T) $(OBJFILES1)
	$(CC) $(CFLAGS) -o testclient1 $(SOURCE_T) $(SOURCE1)

hash: $(OBJFILES_T) $(OBJFILES2)
	$(CC) $(CFLAGS) -o testclient2 $(SOURCE_T) $(SOURCE2)

clean : 
	rm *.o testclient1 testclient2