/*
  Warnings:

  - You are about to drop the column `status` on the `Endereco` table. All the data in the column will be lost.
  - Added the required column `enderecoPadrao` to the `Endereco` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Endereco" DROP COLUMN "status",
ADD COLUMN     "enderecoPadrao" BOOLEAN NOT NULL;
