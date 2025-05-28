import { StatusViagem, TipoViagem } from 'generated/prisma';

export class CreateViagemDto {
  tipoViagem: TipoViagem;
  status: StatusViagem;
  transporteId: string;
  motoristaId: string;
  grupoId: string;
}
