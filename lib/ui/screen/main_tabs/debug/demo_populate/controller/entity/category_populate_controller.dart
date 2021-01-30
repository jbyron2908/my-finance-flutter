import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/icon/icon_converter.dart';
import 'package:my_finance_flutter/core/repository/category/category_repository.dart';

class CategoryPopulateController extends GetxController {
  final CategoryRepository _categoryRepository = Get.find();

  Future<void> clearAll() async {
    await _categoryRepository.clearAll();
  }

  void populate() async {
    await clearAll();
    await populateCarCategory();
    await populateShoppingCategory();
    await populateBillCategory();
    await populateControllCategory();
    await populatePersonalCategory();
    await populateTripCategory();
  }

  void populateCarCategory() async {
    var emptyCategory = CategoryModel.buildEmpty();

    var parent = emptyCategory.copyWith.call(
      id: 0,
      name: 'Carro',
      icon: IconConverter.fromIconAndColor(
        icon: FontAwesomeIcons.car,
        iconColor: Colors.white,
        circleColor: Colors.red[900],
      ),
    );

    await _categoryRepository.save(parent);

    var list = [
      createExpenseCategory(
        emptyCategory,
        parent,
        'Conserto',
        FontAwesomeIcons.wrench,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Gasolina',
        FontAwesomeIcons.gasPump,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Imposto',
        FontAwesomeIcons.dollarSign,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Outros',
        FontAwesomeIcons.minusCircle,
      ),
    ];

    list.forEach(
      (item) async => await _categoryRepository.save(item),
    );
  }

  void populateShoppingCategory() async {
    var emptyCategory = CategoryModel.buildEmpty();

    var parent = emptyCategory.copyWith.call(
      id: 1,
      name: 'Compras',
      icon: IconConverter.fromIconAndColor(
        icon: FontAwesomeIcons.shoppingCart,
        iconColor: Colors.white,
        circleColor: Colors.red[900],
      ),
    );

    await _categoryRepository.save(parent);

    var list = [
      createExpenseCategory(
        emptyCategory,
        parent,
        'Eletronico',
        FontAwesomeIcons.laptop,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Jogo',
        FontAwesomeIcons.gamepad,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Livro',
        FontAwesomeIcons.book,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Outros',
        FontAwesomeIcons.minusCircle,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Presente',
        FontAwesomeIcons.gift,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Roupa',
        FontAwesomeIcons.tshirt,
      ),
    ];

    list.forEach(
      (item) async => await _categoryRepository.save(item),
    );
  }

  void populateBillCategory() async {
    var emptyCategory = CategoryModel.buildEmpty();

    var parent = emptyCategory.copyWith.call(
      id: 2,
      name: 'Contas',
      icon: IconConverter.fromIconAndColor(
        icon: FontAwesomeIcons.shoppingCart,
        iconColor: Colors.white,
        circleColor: Colors.red[900],
      ),
    );

    await _categoryRepository.save(parent);

    var list = [
      createExpenseCategory(
        emptyCategory,
        parent,
        'Casa',
        FontAwesomeIcons.home,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Despesas',
        FontAwesomeIcons.minus,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Estudo',
        FontAwesomeIcons.userGraduate,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Mercado',
        FontAwesomeIcons.shoppingBag,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Moradia',
        FontAwesomeIcons.houseUser,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Saude',
        FontAwesomeIcons.hospital,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Seguro',
        FontAwesomeIcons.houseDamage,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Serviços',
        FontAwesomeIcons.usersCog,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Transporte',
        FontAwesomeIcons.bus,
      ),
    ];

    list.forEach(
      (item) async => await _categoryRepository.save(item),
    );
  }

  void populateControllCategory() async {
    var emptyCategory = CategoryModel.buildEmpty();

    var parent = emptyCategory.copyWith.call(
      id: 2,
      name: 'Controle',
      icon: IconConverter.fromIconAndColor(
        icon: FontAwesomeIcons.shoppingCart,
        iconColor: Colors.white,
        circleColor: Colors.red[900],
      ),
    );

    await _categoryRepository.save(parent);

    var list = [
      createExpenseCategory(
        emptyCategory,
        parent,
        'Emprestado',
        FontAwesomeIcons.commentsDollar,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Outros',
        FontAwesomeIcons.minus,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Pagamento',
        FontAwesomeIcons.fileInvoiceDollar,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Trabalho',
        FontAwesomeIcons.briefcase,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Transferencia',
        FontAwesomeIcons.exchangeAlt,
      ),
    ];

    list.forEach(
      (item) async => await _categoryRepository.save(item),
    );
  }

  void populatePersonalCategory() async {
    var emptyCategory = CategoryModel.buildEmpty();

    var parent = emptyCategory.copyWith.call(
      id: 3,
      name: 'Pessoal',
      icon: IconConverter.fromIconAndColor(
        icon: FontAwesomeIcons.plane,
        iconColor: Colors.white,
        circleColor: Colors.red[900],
      ),
    );

    await _categoryRepository.save(parent);

    var list = [
      createExpenseCategory(
        emptyCategory,
        parent,
        'Ajuda',
        FontAwesomeIcons.smile,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Carteira',
        FontAwesomeIcons.wallet,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Comida',
        FontAwesomeIcons.utensils,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Lazer',
        FontAwesomeIcons.glassMartiniAlt,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Outros',
        FontAwesomeIcons.minusCircle,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Saude',
        FontAwesomeIcons.viruses,
      ),
    ];

    list.forEach(
      (item) async => await _categoryRepository.save(item),
    );
  }

  void populateTripCategory() async {
    var emptyCategory = CategoryModel.buildEmpty();

    var parent = emptyCategory.copyWith.call(
      id: 4,
      name: 'Viagem',
      icon: IconConverter.fromIconAndColor(
        icon: FontAwesomeIcons.plane,
        iconColor: Colors.white,
        circleColor: Colors.red[900],
      ),
    );

    await _categoryRepository.save(parent);

    var list = [
      createExpenseCategory(
        emptyCategory,
        parent,
        'Cambio',
        FontAwesomeIcons.moneyBill,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Comida',
        FontAwesomeIcons.utensils,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Compras',
        FontAwesomeIcons.shoppingBag,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Estadia',
        FontAwesomeIcons.hotel,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Lazer',
        FontAwesomeIcons.glassMartiniAlt,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Outros',
        FontAwesomeIcons.minusCircle,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Passagem',
        FontAwesomeIcons.plane,
      ),
      createExpenseCategory(
        emptyCategory,
        parent,
        'Transporte',
        FontAwesomeIcons.bus,
      ),
    ];

    list.forEach(
      (item) async => await _categoryRepository.save(item),
    );
  }

  CategoryModel createExpenseCategory(
    CategoryModel base,
    CategoryModel parent,
    String name,
    IconData icon,
  ) {
    return base.copyWith.call(
      parent: parent,
      name: name,
      icon: IconConverter.fromIconAndColor(
        icon: icon,
        iconColor: Colors.white,
        circleColor: Colors.red[900],
      ),
    );
  }
}
