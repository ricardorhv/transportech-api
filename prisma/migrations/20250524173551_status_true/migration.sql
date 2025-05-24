-- AlterTable
ALTER TABLE "Usuario" ALTER COLUMN "status" DROP NOT NULL,
ALTER COLUMN "status" SET DEFAULT true;
