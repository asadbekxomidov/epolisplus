import 'package:epolisplus/ui/screens/partners/bloc/partners_bloc.dart';
import 'package:epolisplus/ui/screens/tabbar/ui/screen/tabbar_page.dart';
import 'package:epolisplus/ui/widgets/greenbackground.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PartnersScreen extends StatefulWidget {
  @override
  State<PartnersScreen> createState() => _PartnersScreenState();
}

class _PartnersScreenState extends State<PartnersScreen> {
  late Dimens dimens;

  @override
  void initState() {
    super.initState();
    // partnersBloc o'rnatilmagan bo'lsa, BlocProvider orqali faqat mavjud bo'lishi kerak
    // partnersBloc = BlocProvider.of<PartnersBloc>(context);
    // Yangi partnerlarni olish uchun event yuboramiz
    // partnersBloc.add(PartnersEvent());
  }

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return Scaffold(
      body: GreenImageBackground(
        child: BlocProvider(
          create: (context) => PartnersBloc(),
          child: BlocConsumer<PartnersBloc, PartnersState>(
            listener: (context, state) {
              print('builder 3');
              if (state is PartnersErrorState) {
                showErrorMessageSnackBar(
                  context,
                  state.failure.getErrorMessage(context),
                );
              }
            },
            builder: (context, state) {
              print('builder 1');
              print('${state}');
              if (state is PartnersLoadedState) {
                print('builder 4');
                return ListView.builder(
                  itemCount: state.partners.length,
                  itemBuilder: (context, index) {
                    final partner = state.partners[index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Partner #${partner.id}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Phone: ${partner.phone}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Website: ${partner.site.isEmpty ? 'N/A' : partner.site}',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue),
                            ),
                            SizedBox(height: 10),
                            partner.image.isNotEmpty
                                ? Image.network(
                                    partner.image,
                                    fit: BoxFit.cover,
                                    height: 100, // Tasvir o'lchamini sozlash
                                  )
                                : SizedBox
                                    .shrink(), // Agar image bo'lmasa, bo'sh qoldir
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              print('builder 2');

              print('builder 5');

              print('${state}');

              return Center(child: Text('No partners found.'));
            },
          ),
        ),
      ),
      bottomNavigationBar: TabbarPage(),
    );
  }
}
