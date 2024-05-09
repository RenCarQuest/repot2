import 'package:carguru/core/utils/results.dart';
import 'package:carguru/data/data_sources/faq/faq_data_source.dart';
import 'package:carguru/domain/models/faq/faq_model.dart';

class FaqDataSourceImpl implements FaqDataSource {
  FaqDataSourceImpl();

  @override
  Future<Result<List<FaqModel>>> getFaq() {
    return _mockData();
  }

  Future<Result<List<FaqModel>>> _mockData() async {
    return Future(() => Result.success([
          const FaqModel(
            title: 'Que debo hacer para rentar un carro con UTTIL?',
            description:
                'Rentar un automóvil con nosotros es muy sencillo: primero debes registrarte en nuestra plataforma o hacerlo directamnete desde a aplicación, luego busca el automóvil de tu preferencia, ubicación, fecha, etc… Una vez que encuentres el automóvil de tu preferencia, sigues las sencillas instrucciones para reservarlo y coordinar la entrega con el propietario. Asegúrate de cumplir con los requisitos de edad, licencia de conducir y seguro antes de completar la reserva. ',
          ),
          const FaqModel(
            title: 'Necesito mi propio Seguro?',
            description:
                'Si, UTTIL ofrece tres planes de seguro, podrías considerar revisar las opciones disponibes y elegir el plan que mejor se adapte a tus necesidades y preferencias. Asegúrate de entender que coberturas incluye cada plan y si tienes dudas, puedes contactar al equio de soporte al usuario de UTTIL para obtener asesoramiento.',
          ),
          const FaqModel(
            title: 'Otros pueden conducir un carro que yo he rentado?',
            description:
                'La respuesta a esta pregunta depende de la politica establecida por UTTIL y a las políticas de los propiestarios. TBD',
          ),
          const FaqModel(
            title: 'Cual esla politica de Cancelación de UTTIL',
            description:
                'Cancelación gratuita con aviso previo: Los usuarios pueden cancelar su reserva de forma gratuita si los haccen con un aviso previo determinado de XX días u horas\nPolítica con reembolso parcial: Si la reserva es cancelada dentro de un periodo de tiempo de XX dias / horas se ofrecerá un reembolso parcial de X%  (TBD)\nCancelación con Cargo: Si la reserva es cancelada dentro de un periodo de tiempo inferior a XX dias horas, se aplicará un cargo de cancelación completo.\nCancelación por emergencias o circustancias excepcionales: Se podria considerar una política especial de cancelación para situaciones imprevistas o emergencias donde se permita cancelar sin cargo y reprogramar la reserva.',
          ),
          const FaqModel(
            title:
                'Qué pasa si tengo un incidente con el automóvil durante el alquiler?',
            description:
                'UTTIL ofrece asistencia las 24 horas del día, los 7 días de la semana para que tengas un viaje seguro y confiable. Nuestros usuarios pueden comunicarse con nuestro equipo de soporte para recibir una oportuna asistencia y asi resolver cualquier problema que puedan enfrentar durante su experiencia de alquiler. ',
          ),
          const FaqModel(
            title: 'Es seguro rentar un automóvil a través de  UTTIL',
            description:
                'Si, en UTTIL nos esforzamos por garantizar la mejor experiencia de nuestros usuarios y para ello la seguridad es primordial. La plataforma cuenta con mecanismos de verificación de usuarios, generamos confiana a través de un sistema de evaluaciones y comentarios (tanto de arrendarores como de arrendatarios), establecemos alianzas estratégicas con las más sólidas empresas aseguradoras del mercado para cubrir a los usuarios y propietarios en caso de accidentes, daños o robo durante el periodo de alquiler. Asimismo, realizamos revisiones de los vehículos para garantizar que estén en buenas condiciones y cumplan con las condiciones de seguridad y contamos con tecnología de seguimiento como geococalización e inteligencia artificial . Todo lo anterior con contratos claros que establezcan los términos y condiciones que protejan los derechos y responsabilidades tanto del usuario como del propietario.',
          ),
          const FaqModel(
            title:
                'Pueden entregarme el automóvil en mi ubicación o debo desplazarme y recogerlo donde el arrendador indique?',
            description:
                'Si, en UTTIL es posible que el propietario del vehículo entregue el vehiculo en tu ubicación dependiendo de acueros individuales con el propietario. Algunos propietarios pueden ofrecer servicios de entrega  por una  tarifa adicional mientras que otros podrían estar dispuestos a coordinar el lugar más conveniente para la entrega del vehículo.  Es recomendable antes de hacer la reserva, ponerse en contacto con el usuario a través de la plaaforma para confirmar si ofrecen este servicio y si hay un costo adicional. Adicionalmente, en los filtros para la selección del vehículo de tu preferencia pueden seleccionar aquellos vehpiculos que ofrecen este servicio. ',
          ),
          const FaqModel(
            title:
                'Puendo rentar un automóvil en UTTIL para uso  comercial o de negocio?',
            description:
                'Si, UTTIL ofrece opciones para alquileres con uso comercial o de negocio; no obstante es importante revisar las políticas y restricciones específicas relacionadas con este tipo de alquiler en nuestra plataforma. ',
          ),
        ]));
  }
}
