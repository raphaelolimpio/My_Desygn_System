import 'package:desygn_system/components/cards/card/exemplo_db_para_card/Exemplo_cx_db_user.dart';

class CardViewMode {
  final String title;
  final String subtitle;
  final String? imageUrl;
  final Function()? onTap;
  final double value;
  final Function()? onDecrease;
  final Function()? onMoreOptions;

  CardViewMode({
    required this.title,
    required this.subtitle,
    this.imageUrl,
    required this.value,
    this.onTap,
    this.onDecrease,
    this.onMoreOptions,
  });

  //recebe valor de um db para fabricar card
  factory CardViewMode.fromUsuario(Usuario usuario) {
    return CardViewMode(
      title: usuario.nome,
      subtitle: usuario.escola,
      imageUrl: usuario.imagem,
      value: usuario.deposito,
    );
  }
}
