import { PartialType } from '@nestjs/mapped-types';
import { CreateUsuarioDto } from './create-usuario.dto';

export class UpdateUsuarioDto extends PartialType(CreateUsuarioDto) {
    documento: string;
    nome: string;
    sobrenome: string;
    email: string;
    senha: string;
    telefone: string;
    status: boolean;
    perfilId: string;
    carteiraDeMotorista?: string;
}
