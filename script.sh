nvcc -c vector_add.cu -o vector_add.o
g++ -c main.cpp -o main.o
g++ vector_add.o main.o -o myprogram -lcudart
./myprogram