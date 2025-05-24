/*
  Warnings:

  - You are about to drop the `ListaMotorista` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Motorista` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `carteiraDeMotorista` to the `Usuario` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "ListaMotorista" DROP CONSTRAINT "ListaMotorista_grupoId_fkey";

-- DropForeignKey
ALTER TABLE "ListaMotorista" DROP CONSTRAINT "ListaMotorista_motoristaId_fkey";

-- DropForeignKey
ALTER TABLE "Motorista" DROP CONSTRAINT "Motorista_perfilId_fkey";

-- DropForeignKey
ALTER TABLE "Viagem" DROP CONSTRAINT "Viagem_motoristaId_fkey";

-- AlterTable
ALTER TABLE "Usuario" ADD COLUMN     "carteiraDeMotorista" TEXT NOT NULL;

-- DropTable
DROP TABLE "ListaMotorista";

-- DropTable
DROP TABLE "Motorista";
