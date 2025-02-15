import 'package:get/get.dart';
import 'package:mechtronz/data/network/app_repository.dart';
import 'package:mechtronz/data/network/handle_error.dart';
import 'package:mechtronz/global/widgets/error_dialog.dart';
import 'package:mechtronz/modal/ticket/ticket_request.dart';
import 'package:mechtronz/modal/ticket/ticket_response.dart';

class TicketController extends GetxController {
  bool isCreateLoading = false;
  Future<TicketResult?> createTicket(TicketRequest ticketRequest) async {
    isCreateLoading = true;
    update();
    try {
      final response = await AppRepository().createTicket(ticketRequest);
      if (response.success == true && response.result != null) {
        return response.result;
      } else {
        errorDialog(handleError(response.error));
      }
    } catch (e) {
      errorDialog(handleError(e));
    } finally {
      isCreateLoading = false;
      update();
    }
    return null;
  }
}
