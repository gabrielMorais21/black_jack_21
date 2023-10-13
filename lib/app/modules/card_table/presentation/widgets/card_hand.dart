import 'package:black_jack_21/app/modules/card_table/infra/models/card_model.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardHand extends StatelessWidget {
  final List<Cards> cardsList;
  const CardHand({super.key, required this.cardsList});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return SizedBox(
      width: screenWidth < 600 ? double.infinity : 400.w,
      height: 314.h,
      child: Row(children: [
        cardsList.length <= 2
            ? Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cardsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      cardsList[index].image ?? '',
                      fit: BoxFit.fill,
                    );
                  },
                ),
              )
            : Expanded(
                child: Swiper(
                  controller: SwiperController(),
                  index: cardsList.indexOf(cardsList.last),
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      cardsList[index].image ?? '',
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: cardsList.length,
                  itemWidth: screenWidth < 600 ? 800.w : 180.w,
                  itemHeight: 314.h,
                  layout: SwiperLayout.STACK,
                ),
              )
      ]),
    );
  }
}
