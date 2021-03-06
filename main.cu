#include <cuda_runtime.h>
#include <time.h>
#include <iostream>
#include "Header/CPU_time.h"

#include "Header/common.h"
#include "Header/backtracker_maze_generator.h"
#include "Header/cellular_automata_solver.h"
#include "Header/dfs_maze_generator.h"
#include "Header/wall_follower_maze_solver.h"
#include "Header/division_maze_generator.h"
#include "Header/kruskal_maze_generator.h"
#include "Header/bfs_maze_solver.h"
#include "Header/recursive_maze_solver.h"

#define NUMBER_OF_TEST 3

//DFS: print with side-1

void dfs(int side, int *maze1, int *maze2) {
	double diff;
	cout << endl << "DFS MAZE GENERATOR WITH CPU" << endl;
	double start = seconds();
	CPU_dfs_maze_generator(maze1, side, side);
	diff = seconds()-start;
//	PrintMaze(maze1,side-1,side-1);
	cout << endl << "The time of computation is " << diff << " seconds" << endl;
	cout << endl << "DFS MAZE GENERATOR WITH GPU" << endl;
	start = seconds();
	GPU_dfs_maze_generator(maze2,side,side);
	diff = seconds()-start;
//	PrintMaze(maze2,side-1,side-1);
	cout << endl << "The time of computation is " << diff << " seconds" << endl;
	cudaDeviceReset();
}

void cellular(int side, int *maze1, int *maze2) {
	double diff;
	cout << endl << "CELLULAR AUTOMATA MAZE SOLVER WITH CPU" << endl;
	double start = seconds();
	CPU_cellular_automata_solver(maze1, side, side);
	diff = seconds()-start;
//	PrintMaze(maze1,side,side);
	cout << endl << "The time of computation is " << diff << " seconds" << endl;
	cout << endl << "CELLULAR AUTOMATA MAZE SOLVER WITH GPU" << endl;
	start = seconds();
	GPU_cellular_automata_solver(maze2,side,side);
	diff = seconds()-start;
//	PrintMaze(maze2,side,side);
	cout << endl << "The time of computation is " << diff << " seconds" << endl;
	cudaDeviceReset();
}

void backtracker(int side, int *maze1, int *maze2) {
	double diff;
	cout << endl << "BACKTRACKER MAZE GENERATOR WITH CPU" << endl;
	double start = seconds();
	CPU_backtracker_maze_generator(maze1, side, side);
	diff = seconds()-start;
//	PrintMaze(maze1,side,side);
	cout << endl << "The time of computation is " << diff << " seconds" << endl;
	cout << endl << "BACKTRACKER MAZE GENERATOR WITH GPU" << endl;
	start = seconds();
	GPU_backtracker_maze_generator(maze2,side,side);
	diff = seconds()-start;
//	PrintMaze(maze2,side,side);
	cout << endl << "The time of computation is " << diff << " seconds" << endl;
	cudaDeviceReset();
}

void bfs(int side, int *maze1, int *maze2) {
	double diff;
	cout << endl << "BFS MAZE SOLVER WITH CPU" << endl;
	double start = seconds();
	CPU_bfs_maze_solver(maze1, side, side);
	diff = seconds()-start;
//	PrintMaze(maze1,side,side);
	cout << endl << "The time of computation is " << diff << " seconds" << endl;
	cout << endl << "BFS MAZE SOLVER WITH GPU" << endl;
	start = seconds();
	GPU_bfs_maze_solver(maze2,side,side);
	diff = seconds()-start;
//	PrintMaze(maze2,side,side);
	cout << endl << "The time of computation is " << diff << " seconds" << endl;
	cudaDeviceReset();
}

void division(int side, int *maze1, int *maze2) {
	double diff;
	cout << endl << "DIVISION MAZE GENERATOR WITH CPU" << endl;
	double start = seconds();
	CPU_division_maze_generator(maze1, side, side);
	diff = seconds()-start;
//	PrintMaze(maze1,side,side);
	cout << endl << "The time of computation is " << diff << " seconds" << endl;
	cout << endl << "DIVISION MAZE GENERATOR WITH GPU" << endl;
	start = seconds();
	GPU_division_maze_generator(maze2,side,side);
	diff = seconds()-start;
//	PrintMaze(maze2,side,side);
	cout << endl << "The time of computation is " << diff << " seconds" << endl;
	cudaDeviceReset();
}

void recursive(int side, int *maze1, int *maze2) {
	double diff;
	cout << endl << "RECURSIVE MAZE SOLVER WITH CPU" << endl;
	double start = seconds();
	CPU_recursive_maze_solver(maze1, side, side);
	diff = seconds()-start;
//	PrintMaze(maze1,side,side);
	cout << endl << "The time of computation is " << diff << " seconds" << endl;
	cout << endl << "RECURSIVE MAZE SOLVER WITH GPU" << endl;
	start = seconds();
	GPU_recursive_maze_solver(maze2,side,side);
	diff = seconds()-start;
//	PrintMaze(maze2,side,side);
	cout << endl << "The time of computation is " << diff << " seconds" << endl;
	cudaDeviceReset();
}

void kruskal(int side, int *maze1, int *maze2) { //solo dispari
	double diff;
	cout << endl << "KRUSKAL MAZE GENERATOR WITH CPU" << endl;
	double start = seconds();
	CPU_kruskal_maze_generator(maze1, side, side);
	diff = seconds()-start;
//	PrintMaze(maze1,side,side);
	cout << endl << "The time of computation is " << diff << " seconds" << endl;
	cout << endl << "KRUSKAL MAZE GENERATOR WITH GPU" << endl;
	start = seconds();
	GPU_kruskal_maze_generator(maze2,side,side);
	diff = seconds()-start;
//	PrintMaze(maze2,side,side);
	cout << endl << "The time of computation is " << diff << " seconds" << endl;
	cudaDeviceReset();
}

void wall_follower(int side, int startP, int endP, int *maze1, int *maze2) {
	double diff;
	cout << endl << "WALL FOLLOWER MAZE SOLVER WITH CPU" << endl;
	double start = seconds();
	CPU_wall_follower_maze_solver(maze1, startP, endP, side, side);
	diff = seconds()-start;
//	PrintMaze(maze1,side,side);
	cout << endl << "The time of computation is " << diff << " seconds" << endl;
	cout << endl << "WALL FOLLOWER MAZE SOLVER WITH GPU" << endl;
	start = seconds();
	GPU_wall_follower_maze_solver(maze2,startP, endP, side,side);
	diff = seconds()-start;
//	PrintMaze(maze2,side,side);
	cout << endl << "The time of computation is " << diff << " seconds" << endl;
	cudaDeviceReset();
}

int main(){
	int side = 2000;
	// setted size of the matrix
	int dim = side * side;
	cout << endl << "DIMENSIONE TEST " << dim << endl;
	int *maze1 = new int[dim];
	int *maze2 = new int[dim];

	//DFS
	dfs(side, maze1, maze2);
	// Cellular automata
	cellular(side-1, maze1,maze2);

	// Backtracker
	backtracker(side, maze1, maze2);
	// Wall follower
	wall_follower(side, 1, dim-2, maze1,maze2);

	// Division
	division(side, maze1, maze2);
	// BFS
	bfs(side, maze1,maze2);

	// Kruskal
	kruskal(side-1, maze1, maze2);
	// Recursive
	recursive(side-1, maze1,maze2);

	delete maze1;
	delete maze2;
	return 0;
}

//int main() {
//#define side 100
//	cout << sizeof(int) << endl;
//	//int side = 10;
////	int dim = side * side;
////	int maze[dim];
////	CPU_kruskal_maze_generator(maze,side-1,side-1);
////	PrintMaze(maze,side-1,side-1);
//	return 0;
//}
