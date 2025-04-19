import 'package:ai_storm_hackaton/bloc/action/action_cubit.dart';
import 'package:ai_storm_hackaton/constantes/constantes.dart';
import 'package:ai_storm_hackaton/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController prompt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurple,
      appBar: const IncomeAppBar(),
      body: Stack(children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(children: [
                Container(
                  width: 76,
                  height: 76,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFE2F1FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.20),
                    ),
                  ),
                  child: SizedBox(
                    child: Image.asset(
                      'assets/images/full_agent.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Task Input',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w500,
                      height: 1.31,
                      letterSpacing: -0.45,
                    ),
                  ),
                ),
                TextFormField(
                    style: GoogleFonts.roboto(
                        fontSize: 16, fontWeight: FontWeight.w400),
                    controller: prompt,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF8F8F8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorStyle: GoogleFonts.poppins(
                          color: redColor, fontSize: 12, height: 1),
                      hintText:
                          'Update product pricing on ‘Essential Hoodie’ to €39',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }

                      return null;
                    }),
              ])),
        ),
        Positioned(
            bottom: 20,
            left: 100,
            right: 100,
            height: 60,
            child: BlocConsumer<ActionCubit, ActionState>(
              listener: (context, state) {
                if (state is ActionError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
                if (state is ActionSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Done: ${state.response}')),
                  );
                }
              },
              builder: (context, state) {
                if (state is ActionLoading) {
                  return Container(
                    height: 44,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 12),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFCBFCFA),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 3,
                          color: Color(0xFF2E45E0),
                        ),
                        borderRadius: BorderRadius.circular(51),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x7C5E73FF),
                          blurRadius: 14.60,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: const SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        color: ayorColor,
                        strokeWidth: 2,
                      ),
                    ),
                  );
                }
                return InkWell(
                  onTap: () {
                    BlocProvider.of<ActionCubit>(context)
                        .login("patrickloops808@gmail.com", "Maystro808")
                        .then((_) {
                      BlocProvider.of<ActionCubit>(context)
                          .execute(prompt.text);
                    });
                  },
                  child: Container(
                    height: 44,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 12),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFCBFCFA),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 3,
                          color: Color(0xFF2E45E0),
                        ),
                        borderRadius: BorderRadius.circular(51),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x7C5E73FF),
                          blurRadius: 14.60,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/sparkles.svg',
                          width: 24,
                          height: 24,
                        ),
                        const Text(
                          'Apply Actions',
                          style: TextStyle(
                            color: Color(0xFF2E45E0),
                            fontSize: 18,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ))
      ]),
    );
  }
}
