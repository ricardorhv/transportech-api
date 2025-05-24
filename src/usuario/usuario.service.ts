import { Injectable } from '@nestjs/common';
import { CreateUsuarioDto } from './dto/create-usuario.dto';
import { UpdateUsuarioDto } from './dto/update-usuario.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class UsuarioService {
  constructor(private prisma: PrismaService) {}

  async create(createUsuarioDto: CreateUsuarioDto) {
    const novoUsuario = await this.prisma.usuario.create({
      data: createUsuarioDto,
    });
    return novoUsuario;
  }

  async findAll() {
    const usuarios = await this.prisma.usuario.findMany();
    return usuarios;
  }

  async findOne(id: string) {
    const usuario = await this.prisma.usuario.findUnique({
      where: {
        id,
      },
    });
    return usuario;
  }

  async update(id: string, updateUsuarioDto: UpdateUsuarioDto) {
    const usuarioAtualizado = await this.prisma.usuario.update({
      data: updateUsuarioDto,
      where: {
        id,
      },
    });
    return usuarioAtualizado;
  }

  remove(id: string) {
    return this.prisma.usuario.delete({
      where: {
        id,
      },
    });
  }
}
