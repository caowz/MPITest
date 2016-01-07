vpath %.c src

SRC := std_send_recv.c
EXE := std_send_recv

SRCDIR := ./src
OBJDIR := ./OBJ

OBJ := $(SRC:%.c=%.o)
OBJ := $(foreach file, $(OBJ), $(OBJDIR)/$(file))


all: MKDIR $(EXE)

$(EXE) : $(OBJ) 
	mpicc -g -o $(EXE) $(OBJ) 

$(OBJDIR)/%.o : %.c
	mpicc -g -c $< -o $@

MKDIR :
	mkdir -p OBJ

clean :
	rm -rf $(OBJDIR) 
	rm -f  $(EXE)
