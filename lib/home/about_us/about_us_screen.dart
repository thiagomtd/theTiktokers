import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "images/vtr_logo.png",
                width: 300,
              ),  
              Center(
                child: Column(
                  children: [
                   Text("Sobre",
                    style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 50,
                  ),
                   Text("O ano era 2015 e nosso fundador Ítalo se encontrava insatisfeito com sua pedaleira Zoom G1. Sonhava em desbravar o mundo dos efeitos, mas não tinha recursos financeiros para investir em um setup de pedais ou mesmo em uma nova pedaleira. Contudo, a limitação financeira não foi um empecilho para ele. Pelo contrário, diante deste cenário encontrou o ambiente perfeito para a idealização de um pedal, que de forma despretensiosa se tornaria o sonho chamado VTR EFFECTS./nDesde muito novo sempre observava seu pai, mesmo sem formação na área, consertando alguns equipamentos de casa. Isto o tornou apaixonado por eletrônica, fazendo com que ele buscasse uma formação técnica. Naquele ano, ele já estava no 3º período do curso técnico em eletrotécnica, e apesar de já ter passado anteriormente na cabeça dele a ideia de montar o seu próprio pedal, isso só se torna realmente possível naquele ano. E sim, foi um clássico clone do Tube Screamer TS808 em uma caixinha Hammond pintada com tinta spray. Após montar o primeiro pedal e testar junto com um amigo guitarrista, este projeto se tornou algo mágico, e a ideia de criar sua marca de pedais começou a florescer aos poucos!",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.normal)),
                ]),
              ),         
            ],
          ),
        ),
      ),
    );
  }
}
