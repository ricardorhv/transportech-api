import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateEnderecoDto } from './dto/create-endereco.dto';
import { UpdateEnderecoDto } from './dto/update-endereco.dto';

@Injectable()
export class EnderecoService {
  constructor(private prisma: PrismaService) {}

  async create(createEnderecoDto: CreateEnderecoDto) {
    const novoEndereco = await this.prisma.endereco.create({
      data: createEnderecoDto,
    });
    return novoEndereco;
  }

  async findAll() {
    const listaEnderecos = await this.prisma.endereco.findMany();
    return listaEnderecos;
  }

  async findOne(id: string) {
    const endereco = await this.prisma.endereco.findUnique({
      where: {
        id,
      },
    });
    return endereco;
  }

  async update(id: string, updateEnderecoDto: UpdateEnderecoDto) {
    const enderecoAtualizado = await this.prisma.endereco.update({
      data: updateEnderecoDto,
      where: {
        id,
      },
    });
    return enderecoAtualizado;
  }

  async remove(id: string) {
    await this.prisma.endereco.delete({
      where: {
        id,
      },
    });
  }
}
