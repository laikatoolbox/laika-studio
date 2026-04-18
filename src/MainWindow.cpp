#include "MainWindow.h"
#include "./ui_MainWindow.h"
#include "Color.h"
#include <QElapsedTimer>
#include <random>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow) {
    ui->setupUi(this);
}

MainWindow::~MainWindow() {
    delete ui;
}

void MainWindow::on_testButton_clicked()
{
    // generate an image with random colors
    int width = 5000;
    int height = 5000;
    std::default_random_engine generator;
    std::uniform_real_distribution<float> lDistribution(0.0, 1.0);
    std::uniform_real_distribution<float> aDistribution(-0.5, 0.5);
    std::uniform_real_distribution<float> bDistribution(-0.5, 0.5);
    std::vector<std::vector<LaikaShared::Lab>> image(width, std::vector<LaikaShared::Lab>(height));

    // initial
    for (int x = 0; x < width; x++)
    {
        for (int y = 0; y < height; y++)
        {
            float l = lDistribution(generator);
            float a = aDistribution(generator);
            float b = bDistribution(generator);
            image[x][y] = { .L = l, .a = a, .b  = b };
        }
    }

    // conversion
    QElapsedTimer timer;
    timer.start();
    std::vector<std::vector<LaikaShared::RGB>> imageRgb(width, std::vector<LaikaShared::RGB>(height));
    for (int x = 0; x < width; x++)
    {
        for (int y = 0; y < height; y++)
        {
            imageRgb[x][y] = LaikaShared::oklab_to_linear_srgb(image[x][y]);
        }
    }

    this->ui->runLabel->setText("finished in: " + QString::number(timer.elapsed()));
}

