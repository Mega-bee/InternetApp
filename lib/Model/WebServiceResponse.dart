
class WebServiceResponse {
 dynamic data;
 WebServiceResponse(
      { this.data,
      });

  factory WebServiceResponse.fromJson(Map<String, dynamic> json) => WebServiceResponse(
    data: json["data"],
  );
}