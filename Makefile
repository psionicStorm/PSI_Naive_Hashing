VERSION	= 1.0
CC	= gcc
CFLAGS	= -Wall -g -fopenmp -I. -I/usr/include/psi_util -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/glib-2.0 
LDFLAGS	= -fopenmp -lpsi-util -lm -lssl -lcrypto -lglib-2.0
NAME	= psi-naive-hashing
OBJ	= main.o psi_naive_hashing.o

default: psi-naive-hashing

psi-naive-hashing: $(OBJ)
	$(CC) -o $(NAME) $(OBJ) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $<

clean: 
	rm $(OBJ) $(NAME)

remove:
	rm /usr/bin/$(NAME)

install: psi-naive-hashing
	cp $(NAME) /usr/bin/$(NAME) 
