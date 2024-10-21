import 'package:flutter_test/flutter_test.dart';
import 'package:register/models/user.dart';

void main() {
  test('Deve criar um usuário com todas as propriedades', () {
    final user = User(
      id: '1',
      name: 'Maria',
      email: 'maria@alunos.com.br',
      avatarUrl:
          'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png',
    );

    expect(user.id, '1');
    expect(user.name, 'Maria');
    expect(user.email, 'maria@alunos.com.br');
    expect(user.avatarUrl,
        'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png');
  });

  test('Deve criar um usuário sem avatarUrl e lidar com isso corretamente', () {
    final user = User(
      id: '6',
      name: 'Ana',
      email: 'ana@alunos.com.br',
      avatarUrl: null,
    );

    expect(user.id, '6');
    expect(user.name, 'Ana');
    expect(user.email, 'ana@alunos.com.br');
    expect(user.avatarUrl, isNull);
  });
}
