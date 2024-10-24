#include "sim.h"

const int ALIVE = 1;
const int DEAD  = 0;

// int f(int max) {
//     return simRand() % max;
// }

// Функция для рисования игрового поля
void drawGrid(int grid[SIM_X_SIZE * SIM_Y_SIZE]) {
    for (int y = 0; y < SIM_Y_SIZE; ++y){
      for (int x = 0; x < SIM_X_SIZE; ++x){
        if (grid[y * SIM_X_SIZE + x]== ALIVE){
            simPutPixel(x, y, 0x00FF00);
        }
        else {
            simPutPixel(x, y, 0x0);
        }
      }
    }
    simFlush();
}

// Функция для обновления состояния клетки
char updateCellState(char state, int numNeighbours) {
    if (state == ALIVE && (numNeighbours < 2 || numNeighbours > 3)) {
        return DEAD;
    } else if (state == DEAD && numNeighbours == 3) {
        return ALIVE;
    }
    return state;
}

// Функция для подсчета количества живых соседей
int countNeighbours(int grid[SIM_X_SIZE * SIM_Y_SIZE], int row, int col) {
    int numNeighbours = 0;
    for (int i = -1; i <= 1; ++i) {
        for (int j = -1; j <= 1; ++j) {
            if (i == 0 && j == 0) {
                continue;
            }
            if (row + i >= 0 && row + i < SIM_X_SIZE && col + j >= 0 && col + j < SIM_Y_SIZE) {
                if (grid[(row + i) + (col + j) * SIM_X_SIZE] == ALIVE) {
                    numNeighbours++;
                }
            }
        }
    }
    return numNeighbours;
}

void app() {
    //simRand(); // Инициализация генератора случайных чисел

    // Создание массива для хранения состояния клеток
    int grid[SIM_X_SIZE * SIM_Y_SIZE] = {DEAD};
  

    // Инициализация начальной конфигурации клеток
    int numLivingCells = (simRand() % 10000);
    for (int k = 0; k < numLivingCells; ++k) {
        int r = (simRand() % (SIM_X_SIZE * SIM_Y_SIZE));
        int row = r / (SIM_X_SIZE /  2);
        int col = r % SIM_Y_SIZE;
        grid[row + SIM_X_SIZE * col] = ALIVE;
    }

    // Основной цикл игры
    for (int step = 0; step < 1000; ++step) {
        drawGrid(grid);

        // Обновление состояния всех клеток
        for (int i = 0; i < SIM_X_SIZE; ++i) {
            for (int j = 0; j < SIM_Y_SIZE; ++j) {
                int numNeighbours = countNeighbours(grid, i, j);
                grid[i + SIM_X_SIZE*j] = updateCellState(grid[i + SIM_X_SIZE*j], numNeighbours);
            }
        }
    }
}



