-- CreateTable
CREATE TABLE "Transporte" (
    "id" TEXT NOT NULL,
    "placa" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "imagem" TEXT NOT NULL,
    "dataCadastro" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Transporte_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LocalDeParada" (
    "id" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "dataCadastro" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "LocalDeParada_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Grupo" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "cidadeOrigem" TEXT NOT NULL,
    "cidadeDestino" TEXT NOT NULL,
    "dataCadastro" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" BOOLEAN NOT NULL,
    "localDeParadaId" TEXT NOT NULL,

    CONSTRAINT "Grupo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Perfil" (
    "id" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,

    CONSTRAINT "Perfil_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Motorista" (
    "id" TEXT NOT NULL,
    "documento" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "sobrenome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "carteiraMotorista" TEXT NOT NULL,
    "dataCadastro" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "perfilId" TEXT NOT NULL,

    CONSTRAINT "Motorista_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Usuario" (
    "id" TEXT NOT NULL,
    "documento" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "sobrenome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "dataCadatro" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "perfilId" TEXT NOT NULL,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Viagem" (
    "id" TEXT NOT NULL,
    "dataInicio" TIMESTAMP(3) NOT NULL,
    "dataFinal" TIMESTAMP(3) NOT NULL,
    "tipoViagem" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "transporteId" TEXT NOT NULL,
    "motoristaId" TEXT NOT NULL,
    "grupoId" TEXT NOT NULL,

    CONSTRAINT "Viagem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ListaPresenca" (
    "status" TEXT NOT NULL,
    "usuarioId" TEXT NOT NULL,
    "viagemId" TEXT NOT NULL,

    CONSTRAINT "ListaPresenca_pkey" PRIMARY KEY ("usuarioId","viagemId")
);

-- CreateTable
CREATE TABLE "ListaMotorista" (
    "motoristaId" TEXT NOT NULL,
    "grupoId" TEXT NOT NULL,

    CONSTRAINT "ListaMotorista_pkey" PRIMARY KEY ("grupoId","motoristaId")
);

-- CreateTable
CREATE TABLE "ListaUsuario" (
    "usuarioId" TEXT NOT NULL,
    "grupoId" TEXT NOT NULL,

    CONSTRAINT "ListaUsuario_pkey" PRIMARY KEY ("usuarioId","grupoId")
);

-- CreateTable
CREATE TABLE "Endereco" (
    "id" TEXT NOT NULL,
    "logradouro" TEXT NOT NULL,
    "numero" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "dataCriacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "bairro" TEXT NOT NULL,

    CONSTRAINT "Endereco_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Passageiro" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "email" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "documento" TEXT NOT NULL,
    "dataCriacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "perfilId" TEXT NOT NULL,

    CONSTRAINT "Passageiro_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ListaEndereco" (
    "enderecoId" TEXT NOT NULL,
    "passageiroId" TEXT NOT NULL,

    CONSTRAINT "ListaEndereco_pkey" PRIMARY KEY ("enderecoId","passageiroId")
);

-- CreateTable
CREATE TABLE "ListaPassageiro" (
    "passageiroId" TEXT NOT NULL,
    "grupoId" TEXT NOT NULL,

    CONSTRAINT "ListaPassageiro_pkey" PRIMARY KEY ("grupoId","passageiroId")
);

-- AddForeignKey
ALTER TABLE "Grupo" ADD CONSTRAINT "Grupo_localDeParadaId_fkey" FOREIGN KEY ("localDeParadaId") REFERENCES "LocalDeParada"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Motorista" ADD CONSTRAINT "Motorista_perfilId_fkey" FOREIGN KEY ("perfilId") REFERENCES "Perfil"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Usuario" ADD CONSTRAINT "Usuario_perfilId_fkey" FOREIGN KEY ("perfilId") REFERENCES "Perfil"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Viagem" ADD CONSTRAINT "Viagem_transporteId_fkey" FOREIGN KEY ("transporteId") REFERENCES "Transporte"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Viagem" ADD CONSTRAINT "Viagem_motoristaId_fkey" FOREIGN KEY ("motoristaId") REFERENCES "Motorista"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Viagem" ADD CONSTRAINT "Viagem_grupoId_fkey" FOREIGN KEY ("grupoId") REFERENCES "Grupo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ListaPresenca" ADD CONSTRAINT "ListaPresenca_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ListaPresenca" ADD CONSTRAINT "ListaPresenca_viagemId_fkey" FOREIGN KEY ("viagemId") REFERENCES "Viagem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ListaMotorista" ADD CONSTRAINT "ListaMotorista_motoristaId_fkey" FOREIGN KEY ("motoristaId") REFERENCES "Motorista"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ListaMotorista" ADD CONSTRAINT "ListaMotorista_grupoId_fkey" FOREIGN KEY ("grupoId") REFERENCES "Grupo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ListaUsuario" ADD CONSTRAINT "ListaUsuario_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ListaUsuario" ADD CONSTRAINT "ListaUsuario_grupoId_fkey" FOREIGN KEY ("grupoId") REFERENCES "Grupo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Passageiro" ADD CONSTRAINT "Passageiro_perfilId_fkey" FOREIGN KEY ("perfilId") REFERENCES "Perfil"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ListaEndereco" ADD CONSTRAINT "ListaEndereco_enderecoId_fkey" FOREIGN KEY ("enderecoId") REFERENCES "Endereco"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ListaEndereco" ADD CONSTRAINT "ListaEndereco_passageiroId_fkey" FOREIGN KEY ("passageiroId") REFERENCES "Passageiro"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ListaPassageiro" ADD CONSTRAINT "ListaPassageiro_passageiroId_fkey" FOREIGN KEY ("passageiroId") REFERENCES "Passageiro"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ListaPassageiro" ADD CONSTRAINT "ListaPassageiro_grupoId_fkey" FOREIGN KEY ("grupoId") REFERENCES "Grupo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
