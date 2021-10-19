import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TipoIntervalo { TRABALHO, DESCANSO }

abstract class _PomodoroStore with Store {
  @observable
  bool iniciado = false;

  @observable
  int minutos = 2;

  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDescanso = 1;

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.TRABALHO;

  Timer? cronometro;

  @action
  void iniciarCronometro() {
    iniciado = true;
    cronometro = Timer.periodic(Duration(seconds: 1), (timer) {
      if(minutos == 0 && segundos == 0) {
        _trocarTipoIntervalo();
      } else if(segundos == 0) {
        segundos = 59;
        minutos--;
      } else {
        segundos --;
      }
    });
  }

  @action
  void pararCronometro() {
    iniciado = false;
    cronometro?.cancel();
  }

  @action
  void reiniciarCronometro() {
    iniciado = false;
    pararCronometro();
    minutos = estaTrabalhando() ? tempoTrabalho : tempoDescanso;
    segundos = 0;
  }

  @action
  void incrementarTempoTrabalho() {
    tempoTrabalho++;
    if(estaTrabalhando()) {
      reiniciarCronometro();
    }
  }

  @action
  void decrementarTempoTrabalho() {
    tempoTrabalho--;
    if(estaTrabalhando()) {
      reiniciarCronometro();
    }
  }

  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
    if(estaDescansando()) {
      reiniciarCronometro();
    }
  }

  @action
  void decrementarTempoDescanso() {
    tempoDescanso--;
    if(estaDescansando()) {
      reiniciarCronometro();
    }
  }

  bool estaTrabalhando(){
    return tipoIntervalo == TipoIntervalo.TRABALHO;
  }

  bool estaDescansando() {
    return tipoIntervalo == TipoIntervalo.DESCANSO;
  }

  void _trocarTipoIntervalo() {
    if(estaTrabalhando()) {
      tipoIntervalo = TipoIntervalo.DESCANSO;
      minutos = tempoDescanso;
    } else {
      tipoIntervalo = TipoIntervalo.TRABALHO;
      minutos = tempoTrabalho;
    }
    segundos = 0;
  }
}