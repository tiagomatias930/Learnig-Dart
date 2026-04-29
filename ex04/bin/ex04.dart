import 'dart:io';
import 'package:command_runner/command_runner.dart';
import 'package:http/http.dart' as http;

const version = '0.0.2';

void main(List<String> arguments) async
{
	var runner = CommandRunner();
	
	await runner.run(arguments);
}

Future<String>dataWiki(String titulo) async
{
	final url = Uri.https(
	'en.wikipedia.org',
	'/api/rest_v1/page/summary/$titulo',
	);
	
	final response = await http.get(url);

	if (response.statusCode == 200)
	{
		return response.body;
	}

	return("Erro: Falha na requisição: $titulo");
}


void searcWiki(List<String>? argumentos) async
{
	final String? titulo;

	if (argumentos == null || argumentos.isEmpty)
	{
		print("Por favor digite um titulo de pesquisa: ");
		final inputTitulo = stdin.readLineSync();
		if (inputTitulo == null || inputTitulo.isEmpty)
		{
			print("Nenhum artigo digitado");
			return;
		}
		titulo = inputTitulo;
	}
	else
	{
		titulo = argumentos.join(' ');
	}

	print("Buscando dados sobre '$titulo'. Por favor, aguarde...");
	var conteudo = await dataWiki(titulo);
	print(conteudo);
}

