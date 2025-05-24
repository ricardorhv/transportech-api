/*
  Warnings:

  - A unique constraint covering the columns `[placa]` on the table `Transporte` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Transporte_placa_key" ON "Transporte"("placa");
