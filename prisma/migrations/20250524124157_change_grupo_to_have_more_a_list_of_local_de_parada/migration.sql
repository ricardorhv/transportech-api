/*
  Warnings:

  - You are about to drop the column `localDeParadaId` on the `Grupo` table. All the data in the column will be lost.
  - Added the required column `grupoId` to the `LocalDeParada` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Grupo" DROP CONSTRAINT "Grupo_localDeParadaId_fkey";

-- AlterTable
ALTER TABLE "Grupo" DROP COLUMN "localDeParadaId";

-- AlterTable
ALTER TABLE "LocalDeParada" ADD COLUMN     "grupoId" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "LocalDeParada" ADD CONSTRAINT "LocalDeParada_grupoId_fkey" FOREIGN KEY ("grupoId") REFERENCES "Grupo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
