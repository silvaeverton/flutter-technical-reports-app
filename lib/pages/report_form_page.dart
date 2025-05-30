
import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:signature/signature.dart';
import 'package:intl/intl.dart';


final rawAssinatura = _formKey.currentState?.value['assinatura_cliente'];
Uint8List? assinatura;
final _formKey = GlobalKey<FormBuilderState>();

class FormularioPage extends StatefulWidget {
  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool revendaAcompanhou = false;
  bool encontrouProblemas = false;
  bool possuiObservacoes = false;
  bool entregaTecnicaRealizada = false;
  String? equipamentoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Atendimento'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderDateRangePicker(
                name: 'data_atendimento',
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                format: DateFormat('dd/MM/yyyy'),
                decoration: InputDecoration(labelText: 'Data do Atendimento'),
              ),
              SizedBox(height: 16),

              FormBuilderTextField(
                name: 'revenda',
                decoration: InputDecoration(labelText: 'Revenda'),
              ),
              SizedBox(height: 16),

              FormBuilderDropdown<String>(
                name: 'revenda_acompanhou',
                decoration: InputDecoration(labelText: 'Revenda Acompanhou?'),
                items: ['Sim', 'Não']
                    .map((val) => DropdownMenuItem(value: val, child: Text(val)))
                    .toList(),
                onChanged: (val) {
                  setState(() => revendaAcompanhou = val == 'Sim');
                },
              ),
              if (revendaAcompanhou)
                FormBuilderTextField(
                  name: 'nome_revendedor',
                  decoration: InputDecoration(labelText: 'Nome do Revendedor'),
                ),
              SizedBox(height: 16),

              FormBuilderTextField(
                name: 'nome_cliente',
                decoration: InputDecoration(labelText: 'Nome do Cliente'),
              ),
              SizedBox(height: 16),

              FormBuilderTextField(
                name: 'nome_fazenda',
                decoration: InputDecoration(labelText: 'Nome da Fazenda'),
              ),
              SizedBox(height: 16),

              FormBuilderTextField(
                name: 'cidade',
                decoration: InputDecoration(labelText: 'Cidade'),
              ),
              SizedBox(height: 16),

              FormBuilderTextField(
                name: 'uf',
                decoration: InputDecoration(labelText: 'UF'),
              ),
              SizedBox(height: 16),

              FormBuilderTextField(
                name: 'nome_responsavel',
                decoration: InputDecoration(labelText: 'Responsável da Fazenda'),
              ),
              SizedBox(height: 16),

              FormBuilderTextField(
                name: 'email_responsavel',
                decoration: InputDecoration(labelText: 'E-mail do Responsável'),
              ),
              SizedBox(height: 16),

              FormBuilderTextField(
                name: 'telefone',
                decoration: InputDecoration(labelText: 'Telefone do Cliente ou Responsável'),
              ),
              SizedBox(height: 16),

              FormBuilderTextField(
                name: 'tecnico_responsavel',
                decoration: InputDecoration(labelText: 'Técnico Responsável'),
              ),
              SizedBox(height: 16),

              FormBuilderDropdown<String>(
                name: 'tipo_assistencia',
                decoration: InputDecoration(labelText: 'Tipo de Assistência'),
                items: [
                  'Manutenção',
                  'Análise técnica',
                  'Montagem',
                  'Treinamento',
                  'Manutenção preventiva'
                ]
                    .map((val) => DropdownMenuItem(value: val, child: Text(val)))
                    .toList(),
              ),
              SizedBox(height: 16),

              FormBuilderDropdown<String>(
                name: 'equipamento',
                decoration: InputDecoration(labelText: 'Equipamento'),
                items: ['Pivô', 'Bombeamento', 'Outros']
                    .map((val) => DropdownMenuItem(value: val, child: Text(val)))
                    .toList(),
                onChanged: (val) {
                  setState(() => equipamentoSelecionado = val);
                },
              ),
              if (equipamentoSelecionado == 'Outros')
                FormBuilderTextField(
                  name: 'outro_equipamento',
                  decoration: InputDecoration(labelText: 'Outro Equipamento'),
                ),
              SizedBox(height: 16),

              FormBuilderCheckboxGroup(
                name: 'produtos',
                decoration: InputDecoration(labelText: 'Produtos'),
                options: [
                  FormBuilderChipOption(value: 'Smartconnect G1'),
                  FormBuilderChipOption(value: 'SmartConnect G2'),
                  FormBuilderChipOption(value: 'Irrimesh'),
                  FormBuilderChipOption(value: 'GPS'),
                ],
              ),
              SizedBox(height: 16),

              FormBuilderTextField(
                name: 'descricao_servicos',
                decoration: InputDecoration(labelText: 'Serviços Realizados'),
                maxLines: 5,
              ),
              SizedBox(height: 16),

              FormBuilderFilePicker(
                name: 'midia_servico',
                decoration: InputDecoration(labelText: 'Fotos/Vídeos do Serviço'),
                maxFiles: 5,
                previewImages: true,
              ),
              SizedBox(height: 16),

              FormBuilderDropdown<String>(
                name: 'problemas_encontrados',
                decoration: InputDecoration(labelText: 'Problemas encontrados?'),
                items: ['Sim', 'Não']
                    .map((val) => DropdownMenuItem(value: val, child: Text(val)))
                    .toList(),
                onChanged: (val) {
                  setState(() => encontrouProblemas = val == 'Sim');
                },
              ),
              if (encontrouProblemas) ...[
                FormBuilderTextField(
                  name: 'descricao_problemas',
                  decoration: InputDecoration(labelText: 'Descrição dos Problemas'),
                  maxLines: 3,
                ),
                FormBuilderFilePicker(
                  name: 'midia_problemas',
                  decoration: InputDecoration(labelText: 'Mídias dos Problemas'),
                  maxFiles: 5,
                  previewImages: true,
                ),
              ],
              SizedBox(height: 16),

              FormBuilderDropdown<String>(
                name: 'entrega_tecnica_realizada',
                decoration: InputDecoration(labelText: 'Entrega técnica realizada?'),
                items: ['Sim', 'Não']
                    .map((val) => DropdownMenuItem(value: val, child: Text(val)))
                    .toList(),
                onChanged: (val) {
                  setState(() => entregaTecnicaRealizada = val == 'Sim');
                },
              ),
              if (entregaTecnicaRealizada)
                FormBuilderTextField(
                  name: 'descricao_entrega_tecnica',
                  decoration: InputDecoration(labelText: 'Descrição da Entrega Técnica'),
                  maxLines: 3,
                ),
              SizedBox(height: 16),

              Text('20. De 0 a 5 qual a satisfação com o técnico?',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              FormBuilderSlider(
                name: 'satisfacao_tecnico',
                min: 0,
                max: 5,
                divisions: 5,
                initialValue: 3,
              ),
              SizedBox(height: 16),

              Text('21. De 0 a 5 qual a satisfação com a Bauer/Irricontrol?',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              FormBuilderSlider(
                name: 'satisfacao_empresa',
                min: 0,
                max: 5,
                divisions: 5,
                initialValue: 3,
              ),
              SizedBox(height: 16),

              FormBuilderDropdown<String>(
                name: 'possui_observacoes',
                decoration: InputDecoration(labelText: 'Deseja adicionar observações?'),
                items: ['Sim', 'Não']
                    .map((val) => DropdownMenuItem(value: val, child: Text(val)))
                    .toList(),
                onChanged: (val) {
                  setState(() => possuiObservacoes = val == 'Sim');
                },
              ),
              if (possuiObservacoes)
                FormBuilderTextField(
                  name: 'observacoes',
                  decoration: InputDecoration(labelText: 'Observações Gerais'),
                  maxLines: 4,
                ),
              SizedBox(height: 16),
                FormBuilderSignaturePad(
    name: 'assinatura_cliente',
    decoration: InputDecoration(labelText: 'Assinatura do Cliente'),
    border: Border.all(color: Colors.grey),
    height: 150,
    ),
    SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.save();

                  final assinaturaRaw = _formKey.currentState!.value['assinatura_cliente'];

                  if (assinaturaRaw is Uint8List) {
                    // Aqui você pode salvar ou enviar a assinatura
                    print('Assinatura capturada com ${assinaturaRaw.lengthInBytes} bytes');
                  } else {
                    print('Assinatura não capturada corretamente');
                  }
                },
                child: Text('Enviar Formulário'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}