class Reserva {
  final int id;
  final Attributes attributes;

  Reserva({
    required this.id,
    required this.attributes,
  });

  factory Reserva.fromJson(Map<String, dynamic> json) {
    return Reserva(
      id: json['id'],
      attributes: Attributes.fromJson(json['attributes']),
    );
  }
}

class Attributes {
  final String title;
  final String start;
  final String end;
  final bool isSemester;
  final String status;
  final String color;
  final String? reasonForDisapproved;
  final String createdAt;
  final String updatedAt;
  final String publishedAt;

  Attributes({
    required this.title,
    required this.start,
    required this.end,
    required this.isSemester,
    required this.status,
    required this.color,
    this.reasonForDisapproved,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      title: json['title'],
      start: json['start'],
      end: json['end'],
      isSemester: json['isSemester'],
      status: json['status'],
      color: json['color'],
      reasonForDisapproved: json['reasonForDisapproved'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      publishedAt: json['publishedAt'],
    );
  }
}

class Meta {
  final Pagination pagination;

  Meta({required this.pagination});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

class Pagination {
  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      page: json['page'],
      pageSize: json['pageSize'],
      pageCount: json['pageCount'],
      total: json['total'],
    );
  }
}

class ReservaResponse {
  final List<Reserva> data;
  final Meta meta;

  ReservaResponse({required this.data, required this.meta});

  factory ReservaResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Reserva> dataList = list.map((i) => Reserva.fromJson(i)).toList();
    return ReservaResponse(
      data: dataList,
      meta: Meta.fromJson(json['meta']),
    );
  }
}
