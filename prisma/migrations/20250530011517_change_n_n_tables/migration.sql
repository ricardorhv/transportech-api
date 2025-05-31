/*
  Warnings:

  - You are about to drop the `ListaEndereco` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ListaUsuario` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "ListaEndereco" DROP CONSTRAINT "ListaEndereco_enderecoId_fkey";

-- DropForeignKey
ALTER TABLE "ListaEndereco" DROP CONSTRAINT "ListaEndereco_usuarioId_fkey";

-- DropForeignKey
ALTER TABLE "ListaUsuario" DROP CONSTRAINT "ListaUsuario_grupoId_fkey";

-- DropForeignKey
ALTER TABLE "ListaUsuario" DROP CONSTRAINT "ListaUsuario_usuarioId_fkey";

-- DropTable
DROP TABLE "ListaEndereco";

-- DropTable
DROP TABLE "ListaUsuario";

-- CreateTable
CREATE TABLE "_GrupoToUsuario" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_GrupoToUsuario_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_EnderecoToUsuario" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_EnderecoToUsuario_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "_GrupoToUsuario_B_index" ON "_GrupoToUsuario"("B");

-- CreateIndex
CREATE INDEX "_EnderecoToUsuario_B_index" ON "_EnderecoToUsuario"("B");

-- AddForeignKey
ALTER TABLE "_GrupoToUsuario" ADD CONSTRAINT "_GrupoToUsuario_A_fkey" FOREIGN KEY ("A") REFERENCES "Grupo"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GrupoToUsuario" ADD CONSTRAINT "_GrupoToUsuario_B_fkey" FOREIGN KEY ("B") REFERENCES "Usuario"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EnderecoToUsuario" ADD CONSTRAINT "_EnderecoToUsuario_A_fkey" FOREIGN KEY ("A") REFERENCES "Endereco"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EnderecoToUsuario" ADD CONSTRAINT "_EnderecoToUsuario_B_fkey" FOREIGN KEY ("B") REFERENCES "Usuario"("id") ON DELETE CASCADE ON UPDATE CASCADE;
