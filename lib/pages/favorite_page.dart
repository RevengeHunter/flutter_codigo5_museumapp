import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codigo5_museumapp/models/museum_model.dart';
import 'package:flutter_codigo5_museumapp/services/api_service.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class FacoritePage extends StatefulWidget {
  @override
  State<FacoritePage> createState() => _FacoritePageState();
}

class _FacoritePageState extends State<FacoritePage> {
  APIService apiService = APIService();

  List<MuseumModel> museumModelList = [];

  initState() {
    super.initState();
    _getMuseum();
  }

  _getMuseum() {
    apiService.getMuseums().then((value) {
      museumModelList = value;
    });
  }

  _generatePDF() async {
    ByteData bytesX = await rootBundle.load("assets/images/Museo03.jpeg");
    Uint8List imageBytes = bytesX.buffer.asUint8List();

    pw.Document pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          // return pw.Text("Hola",);
          // return pw.Image(pw.MemoryImage(imageBytes));
          return [
            pw.Table(
              children: [
                pw.TableRow(
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Image(
                          pw.MemoryImage(
                            imageBytes,
                          ),
                          height: 100.0,
                        ),
                        pw.Container(
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                              pw.Text(
                                  "Calle Los Portales 23232 - Cayma - Arequipa"),
                              pw.Text("Tlf: 43432232"),
                              pw.Text("E-mail: isddasd@gmail.com"),
                              pw.Text("Pagina web: www.sasaddsda.com"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Divider(),
                  ],
                ),
              ],
            ),
            pw.Table(
              children: List.generate(
                museumModelList.length,
                    (index) => pw.TableRow(
                  children: [
                    pw.Text(museumModelList[index].name),
                  ],
                ),
              ),
            ),
          ];
        },
      ),
    );

    // pdf.addPage(
    //   pw.MultiPage(
    //     pageFormat: PdfPageFormat.a4,
    //     build: (pw.Context contex){
    //       return[
    //         pw.Text("sdsd"),
    //       ];
    //     }
    //   ),
    // );

    Uint8List bytes = await pdf.save();
    Directory dir = await getApplicationDocumentsDirectory();
    print(dir.path);
    File _file = File("${dir.path}/example02PDF.pdf");
    _file.exists().then((value) async {
      if (value) {
        _file.delete().then((value) {});
      } else {
        _file.writeAsBytes(bytes);
        _file.create();
        OpenFile.open(_file.path);
        await OpenFile.open(_file.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _generatePDF();
            },
            child: Text(
              "Generar PDF",
            ),
          ),
        ],
      ),
    );
  }
}
