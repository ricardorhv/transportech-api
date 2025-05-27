import { Body, Controller, Get, Param, Patch, Post } from '@nestjs/common';
import { CreateViagemDto } from './dto/create-viagem.dto';
import { UpdateViagemDto } from './dto/update-viagem.dto';
import { ViagemService } from './viagem.service';

@Controller('viagem')
export class ViagemController {
  constructor(private readonly viagemService: ViagemService) {}

  @Post()
  create(@Body() createViagemDto: CreateViagemDto) {
    return this.viagemService.create(createViagemDto);
  }

  @Get()
  findAll() {
    return this.viagemService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.viagemService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateViagemDto: UpdateViagemDto) {
    return this.viagemService.update(id, updateViagemDto);
  }

  // @Delete(':id')
  // remove(@Param('id') id: string) {
  //   return this.viagemService.remove(id);
  // }
}
