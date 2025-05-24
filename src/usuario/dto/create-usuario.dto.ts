export class CreateUsuarioDto {
    documento: string;
    nome: string;
    sobrenome: string;
    email: string;
    senha: string;
    telefone: string; 
    perfilId: string;
    carteiraDeMotorista?: string;
}
