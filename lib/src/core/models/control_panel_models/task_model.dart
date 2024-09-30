/// data : {"tickets":[{"id":9189,"track_id":"130924-000-002","title":"🔑 Регистрация в МФЦА","author":{"id":2490,"photo":"/static/uploads/image/4e/21/4e2189a5dc88427d82b97f4cb2eff6d2.jpg","sip_id":null,"username":"sirozhiddin_nuriddinov","last_name":"Nuriddinov","first_name":"Sirozhiddin","patronymic":"qwe","display_name":"Sirozhiddin Nuriddinov"},"customer":{"id":2945,"last_name":"Бахретдинов","first_name":"Серик","patronymic":"Кувантаевич"},"channel":"id","sender":"2945","form":{"id":224,"title":"🔑 Регистрация в МФЦА"},"project":{"id":1736,"type":"support","title":"Регистрация в МФЦА"},"priority":null,"status":{"id":6658,"type":1,"title":"Новый"},"type":null,"comments_count":0,"rating":-1,"resolved":null,"assignees":null,"has_more_assignees":false,"assignees_count":0,"assignee":[],"deadline":null,"tags":null,"order":-9043,"checklists":{},"attachments":0,"mentions":[],"is_new":false,"bg":null,"has_message":null,"message_from_support":null,"time":null,"project_category_id":null,"sender_info":"user:id:2945","datetime":1726221468,"deadline_close_fact":null,"time_react_plan":1726223268,"time_react_fact":null,"time_close_fact":null,"time_close_plan":null,"deadline_status":null,"time_react_status":"TIME_LEFT","time_close_status":null,"redirect_count":0,"is_parent":false,"parent_id":null}],"total":1}
/// _success : true
/// static_host_name : "https://inqbox.q19.kz"

class TaskModel {
  TaskModel({
    Data? data,
    bool? success,
    String? staticHostName,
  }) {
    _data = data;
    _success = success;
    _staticHostName = staticHostName;
  }

  TaskModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['_success'];
    _staticHostName = json['static_host_name'];
  }
  Data? _data;
  bool? _success;
  String? _staticHostName;
  TaskModel copyWith({
    Data? data,
    bool? success,
    String? staticHostName,
  }) =>
      TaskModel(
        data: data ?? _data,
        success: success ?? _success,
        staticHostName: staticHostName ?? _staticHostName,
      );
  Data? get data => _data;
  bool? get success => _success;
  String? get staticHostName => _staticHostName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['_success'] = _success;
    map['static_host_name'] = _staticHostName;
    return map;
  }
}

/// tickets : [{"id":9189,"track_id":"130924-000-002","title":"🔑 Регистрация в МФЦА","author":{"id":2490,"photo":"/static/uploads/image/4e/21/4e2189a5dc88427d82b97f4cb2eff6d2.jpg","sip_id":null,"username":"sirozhiddin_nuriddinov","last_name":"Nuriddinov","first_name":"Sirozhiddin","patronymic":"qwe","display_name":"Sirozhiddin Nuriddinov"},"customer":{"id":2945,"last_name":"Бахретдинов","first_name":"Серик","patronymic":"Кувантаевич"},"channel":"id","sender":"2945","form":{"id":224,"title":"🔑 Регистрация в МФЦА"},"project":{"id":1736,"type":"support","title":"Регистрация в МФЦА"},"priority":null,"status":{"id":6658,"type":1,"title":"Новый"},"type":null,"comments_count":0,"rating":-1,"resolved":null,"assignees":null,"has_more_assignees":false,"assignees_count":0,"assignee":[],"deadline":null,"tags":null,"order":-9043,"checklists":{},"attachments":0,"mentions":[],"is_new":false,"bg":null,"has_message":null,"message_from_support":null,"time":null,"project_category_id":null,"sender_info":"user:id:2945","datetime":1726221468,"deadline_close_fact":null,"time_react_plan":1726223268,"time_react_fact":null,"time_close_fact":null,"time_close_plan":null,"deadline_status":null,"time_react_status":"TIME_LEFT","time_close_status":null,"redirect_count":0,"is_parent":false,"parent_id":null}]
/// total : 1

class Data {
  Data({
    List<Tickets>? tickets,
    num? total,
  }) {
    _tickets = tickets;
    _total = total;
  }

  Data.fromJson(dynamic json) {
    if (json['tickets'] != null) {
      _tickets = [];
      json['tickets'].forEach((v) {
        _tickets?.add(Tickets.fromJson(v));
      });
    }
    _total = json['total'];
  }
  List<Tickets>? _tickets;
  num? _total;
  Data copyWith({
    List<Tickets>? tickets,
    num? total,
  }) =>
      Data(
        tickets: tickets ?? _tickets,
        total: total ?? _total,
      );
  List<Tickets>? get tickets => _tickets;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_tickets != null) {
      map['tickets'] = _tickets?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    return map;
  }
}

/// id : 9189
/// track_id : "130924-000-002"
/// title : "🔑 Регистрация в МФЦА"
/// author : {"id":2490,"photo":"/static/uploads/image/4e/21/4e2189a5dc88427d82b97f4cb2eff6d2.jpg","sip_id":null,"username":"sirozhiddin_nuriddinov","last_name":"Nuriddinov","first_name":"Sirozhiddin","patronymic":"qwe","display_name":"Sirozhiddin Nuriddinov"}
/// customer : {"id":2945,"last_name":"Бахретдинов","first_name":"Серик","patronymic":"Кувантаевич"}
/// channel : "id"
/// sender : "2945"
/// form : {"id":224,"title":"🔑 Регистрация в МФЦА"}
/// project : {"id":1736,"type":"support","title":"Регистрация в МФЦА"}
/// priority : null
/// status : {"id":6658,"type":1,"title":"Новый"}
/// type : null
/// comments_count : 0
/// rating : -1
/// resolved : null
/// assignees : null
/// has_more_assignees : false
/// assignees_count : 0
/// assignee : []
/// deadline : null
/// tags : null
/// order : -9043
/// checklists : {}
/// attachments : 0
/// mentions : []
/// is_new : false
/// bg : null
/// has_message : null
/// message_from_support : null
/// time : null
/// project_category_id : null
/// sender_info : "user:id:2945"
/// datetime : 1726221468
/// deadline_close_fact : null
/// time_react_plan : 1726223268
/// time_react_fact : null
/// time_close_fact : null
/// time_close_plan : null
/// deadline_status : null
/// time_react_status : "TIME_LEFT"
/// time_close_status : null
/// redirect_count : 0
/// is_parent : false
/// parent_id : null

class Tickets {
  Tickets({
    num? id,
    String? trackId,
    String? title,
    Author? author,
    Customer? customer,
    String? channel,
    String? sender,
    Form? form,
    Project? project,
    dynamic priority,
    TaskModelStatus? status,
    dynamic type,
    num? commentsCount,
    num? rating,
    dynamic resolved,
    dynamic assignees,
    bool? hasMoreAssignees,
    num? assigneesCount,
    List<dynamic>? assignee,
    dynamic deadline,
    dynamic tags,
    num? order,
    dynamic checklists,
    num? attachments,
    List<dynamic>? mentions,
    bool? isNew,
    dynamic bg,
    dynamic hasMessage,
    dynamic messageFromSupport,
    dynamic time,
    dynamic projectCategoryId,
    String? senderInfo,
    num? datetime,
    dynamic deadlineCloseFact,
    num? timeReactPlan,
    dynamic timeReactFact,
    dynamic timeCloseFact,
    dynamic timeClosePlan,
    dynamic deadlineStatus,
    String? timeReactStatus,
    dynamic timeCloseStatus,
    num? redirectCount,
    bool? isParent,
    dynamic parentId,
  }) {
    _id = id;
    _trackId = trackId;
    _title = title;
    _author = author;
    _customer = customer;
    _channel = channel;
    _sender = sender;
    _form = form;
    _project = project;
    _priority = priority;
    _status = status;
    _type = type;
    _commentsCount = commentsCount;
    _rating = rating;
    _resolved = resolved;
    _assignees = assignees;
    _hasMoreAssignees = hasMoreAssignees;
    _assigneesCount = assigneesCount;
    _assignee = assignee;
    _deadline = deadline;
    _tags = tags;
    _order = order;
    _checklists = checklists;
    _attachments = attachments;
    _mentions = mentions;
    _isNew = isNew;
    _bg = bg;
    _hasMessage = hasMessage;
    _messageFromSupport = messageFromSupport;
    _time = time;
    _projectCategoryId = projectCategoryId;
    _senderInfo = senderInfo;
    _datetime = datetime;
    _deadlineCloseFact = deadlineCloseFact;
    _timeReactPlan = timeReactPlan;
    _timeReactFact = timeReactFact;
    _timeCloseFact = timeCloseFact;
    _timeClosePlan = timeClosePlan;
    _deadlineStatus = deadlineStatus;
    _timeReactStatus = timeReactStatus;
    _timeCloseStatus = timeCloseStatus;
    _redirectCount = redirectCount;
    _isParent = isParent;
    _parentId = parentId;
  }

  Tickets.fromJson(dynamic json) {
    _id = json['id'];
    _trackId = json['track_id'];
    _title = json['title'];
    _author = json['author'] != null ? Author.fromJson(json['author']) : null;
    _customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    _channel = json['channel'];
    _sender = json['sender'];
    _form = json['form'] != null ? Form.fromJson(json['form']) : null;
    _project =
        json['project'] != null ? Project.fromJson(json['project']) : null;
    _priority = json['priority'];
    _status = json['status'] != null
        ? TaskModelStatus.fromJson(json['status'])
        : null;
    _type = json['type'];
    _commentsCount = json['comments_count'];
    _rating = json['rating'];
    _resolved = json['resolved'];
    _assignees = json['assignees'];
    _hasMoreAssignees = json['has_more_assignees'];
    _assigneesCount = json['assignees_count'];
    if (json['assignee'] != null) {
      _assignee = [];
      json['assignee'].forEach((v) {
        _assignee?.add(Tickets.fromJson(v));
      });
    }
    _deadline = json['deadline'];
    _tags = json['tags'];
    _order = json['order'];
    _checklists = json['checklists'];
    _attachments = json['attachments'];
    if (json['mentions'] != null) {
      _mentions = [];
      json['mentions'].forEach((v) {
        _mentions?.add(Tickets.fromJson(v));
      });
    }
    _isNew = json['is_new'];
    _bg = json['bg'];
    _hasMessage = json['has_message'];
    _messageFromSupport = json['message_from_support'];
    _time = json['time'];
    _projectCategoryId = json['project_category_id'];
    _senderInfo = json['sender_info'];
    _datetime = json['datetime'];
    _deadlineCloseFact = json['deadline_close_fact'];
    _timeReactPlan = json['time_react_plan'];
    _timeReactFact = json['time_react_fact'];
    _timeCloseFact = json['time_close_fact'];
    _timeClosePlan = json['time_close_plan'];
    _deadlineStatus = json['deadline_status'];
    _timeReactStatus = json['time_react_status'];
    _timeCloseStatus = json['time_close_status'];
    _redirectCount = json['redirect_count'];
    _isParent = json['is_parent'];
    _parentId = json['parent_id'];
  }

  num? _id;
  String? _trackId;
  String? _title;
  Author? _author;
  Customer? _customer;
  String? _channel;
  String? _sender;
  Form? _form;
  Project? _project;
  dynamic _priority;
  TaskModelStatus? _status;
  dynamic _type;
  num? _commentsCount;
  num? _rating;
  dynamic _resolved;
  dynamic _assignees;
  bool? _hasMoreAssignees;
  num? _assigneesCount;
  List<dynamic>? _assignee;
  dynamic _deadline;
  dynamic _tags;
  num? _order;
  dynamic _checklists;
  num? _attachments;
  List<dynamic>? _mentions;
  bool? _isNew;
  dynamic _bg;
  dynamic _hasMessage;
  dynamic _messageFromSupport;
  dynamic _time;
  dynamic _projectCategoryId;
  String? _senderInfo;
  num? _datetime;
  dynamic _deadlineCloseFact;
  num? _timeReactPlan;
  dynamic _timeReactFact;
  dynamic _timeCloseFact;
  dynamic _timeClosePlan;
  dynamic _deadlineStatus;
  String? _timeReactStatus;
  dynamic _timeCloseStatus;
  num? _redirectCount;
  bool? _isParent;
  dynamic _parentId;

  Tickets copyWith({
    num? id,
    String? trackId,
    String? title,
    Author? author,
    Customer? customer,
    String? channel,
    String? sender,
    Form? form,
    Project? project,
    dynamic priority,
    TaskModelStatus? status,
    dynamic type,
    num? commentsCount,
    num? rating,
    dynamic resolved,
    dynamic assignees,
    bool? hasMoreAssignees,
    num? assigneesCount,
    List<dynamic>? assignee,
    dynamic deadline,
    dynamic tags,
    num? order,
    dynamic checklists,
    num? attachments,
    List<dynamic>? mentions,
    bool? isNew,
    dynamic bg,
    dynamic hasMessage,
    dynamic messageFromSupport,
    dynamic time,
    dynamic projectCategoryId,
    String? senderInfo,
    num? datetime,
    dynamic deadlineCloseFact,
    num? timeReactPlan,
    dynamic timeReactFact,
    dynamic timeCloseFact,
    dynamic timeClosePlan,
    dynamic deadlineStatus,
    String? timeReactStatus,
    dynamic timeCloseStatus,
    num? redirectCount,
    bool? isParent,
    dynamic parentId,
  }) =>
      Tickets(
        id: id ?? _id,
        trackId: trackId ?? _trackId,
        title: title ?? _title,
        author: author ?? _author,
        customer: customer ?? _customer,
        channel: channel ?? _channel,
        sender: sender ?? _sender,
        form: form ?? _form,
        project: project ?? _project,
        priority: priority ?? _priority,
        status: status ?? _status,
        type: type ?? _type,
        commentsCount: commentsCount ?? _commentsCount,
        rating: rating ?? _rating,
        resolved: resolved ?? _resolved,
        assignees: assignees ?? _assignees,
        hasMoreAssignees: hasMoreAssignees ?? _hasMoreAssignees,
        assigneesCount: assigneesCount ?? _assigneesCount,
        assignee: assignee ?? _assignee,
        deadline: deadline ?? _deadline,
        tags: tags ?? _tags,
        order: order ?? _order,
        checklists: checklists ?? _checklists,
        attachments: attachments ?? _attachments,
        mentions: mentions ?? _mentions,
        isNew: isNew ?? _isNew,
        bg: bg ?? _bg,
        hasMessage: hasMessage ?? _hasMessage,
        messageFromSupport: messageFromSupport ?? _messageFromSupport,
        time: time ?? _time,
        projectCategoryId: projectCategoryId ?? _projectCategoryId,
        senderInfo: senderInfo ?? _senderInfo,
        datetime: datetime ?? _datetime,
        deadlineCloseFact: deadlineCloseFact ?? _deadlineCloseFact,
        timeReactPlan: timeReactPlan ?? _timeReactPlan,
        timeReactFact: timeReactFact ?? _timeReactFact,
        timeCloseFact: timeCloseFact ?? _timeCloseFact,
        timeClosePlan: timeClosePlan ?? _timeClosePlan,
        deadlineStatus: deadlineStatus ?? _deadlineStatus,
        timeReactStatus: timeReactStatus ?? _timeReactStatus,
        timeCloseStatus: timeCloseStatus ?? _timeCloseStatus,
        redirectCount: redirectCount ?? _redirectCount,
        isParent: isParent ?? _isParent,
        parentId: parentId ?? _parentId,
      );
  num? get id => _id;
  String? get trackId => _trackId;
  String? get title => _title;
  Author? get author => _author;
  Customer? get customer => _customer;
  String? get channel => _channel;
  String? get sender => _sender;
  Form? get form => _form;
  Project? get project => _project;
  dynamic get priority => _priority;
  TaskModelStatus? get status => _status;
  dynamic get type => _type;
  num? get commentsCount => _commentsCount;
  num? get rating => _rating;
  dynamic get resolved => _resolved;
  dynamic get assignees => _assignees;
  bool? get hasMoreAssignees => _hasMoreAssignees;
  num? get assigneesCount => _assigneesCount;
  List<dynamic>? get assignee => _assignee;
  dynamic get deadline => _deadline;
  dynamic get tags => _tags;
  num? get order => _order;
  dynamic get checklists => _checklists;
  num? get attachments => _attachments;
  List<dynamic>? get mentions => _mentions;
  bool? get isNew => _isNew;
  dynamic get bg => _bg;
  dynamic get hasMessage => _hasMessage;
  dynamic get messageFromSupport => _messageFromSupport;
  dynamic get time => _time;
  dynamic get projectCategoryId => _projectCategoryId;
  String? get senderInfo => _senderInfo;
  num? get datetime => _datetime;
  dynamic get deadlineCloseFact => _deadlineCloseFact;
  num? get timeReactPlan => _timeReactPlan;
  dynamic get timeReactFact => _timeReactFact;
  dynamic get timeCloseFact => _timeCloseFact;
  dynamic get timeClosePlan => _timeClosePlan;
  dynamic get deadlineStatus => _deadlineStatus;
  String? get timeReactStatus => _timeReactStatus;
  dynamic get timeCloseStatus => _timeCloseStatus;
  num? get redirectCount => _redirectCount;
  bool? get isParent => _isParent;
  dynamic get parentId => _parentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['track_id'] = _trackId;
    map['title'] = _title;
    if (_author != null) {
      map['author'] = _author?.toJson();
    }
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    map['channel'] = _channel;
    map['sender'] = _sender;
    if (_form != null) {
      map['form'] = _form?.toJson();
    }
    if (_project != null) {
      map['project'] = _project?.toJson();
    }
    map['priority'] = _priority;
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    map['type'] = _type;
    map['comments_count'] = _commentsCount;
    map['rating'] = _rating;
    map['resolved'] = _resolved;
    map['assignees'] = _assignees;
    map['has_more_assignees'] = _hasMoreAssignees;
    map['assignees_count'] = _assigneesCount;
    if (_assignee != null) {
      map['assignee'] = _assignee?.map((v) => v.toJson()).toList();
    }
    map['deadline'] = _deadline;
    map['tags'] = _tags;
    map['order'] = _order;
    map['checklists'] = _checklists;
    map['attachments'] = _attachments;
    if (_mentions != null) {
      map['mentions'] = _mentions?.map((v) => v.toJson()).toList();
    }
    map['is_new'] = _isNew;
    map['bg'] = _bg;
    map['has_message'] = _hasMessage;
    map['message_from_support'] = _messageFromSupport;
    map['time'] = _time;
    map['project_category_id'] = _projectCategoryId;
    map['sender_info'] = _senderInfo;
    map['datetime'] = _datetime;
    map['deadline_close_fact'] = _deadlineCloseFact;
    map['time_react_plan'] = _timeReactPlan;
    map['time_react_fact'] = _timeReactFact;
    map['time_close_fact'] = _timeCloseFact;
    map['time_close_plan'] = _timeClosePlan;
    map['deadline_status'] = _deadlineStatus;
    map['time_react_status'] = _timeReactStatus;
    map['time_close_status'] = _timeCloseStatus;
    map['redirect_count'] = _redirectCount;
    map['is_parent'] = _isParent;
    map['parent_id'] = _parentId;
    return map;
  }
}

/// id : 6658
/// type : 1
/// title : "Новый"

class TaskModelStatus {
  TaskModelStatus({
    num? id,
    num? type,
    String? title,
  }) {
    _id = id;
    _type = type;
    _title = title;
  }

  TaskModelStatus.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _title = json['title'];
  }
  num? _id;
  num? _type;
  String? _title;
  TaskModelStatus copyWith({
    num? id,
    num? type,
    String? title,
  }) =>
      TaskModelStatus(
        id: id ?? _id,
        type: type ?? _type,
        title: title ?? _title,
      );
  num? get id => _id;
  num? get type => _type;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['title'] = _title;
    return map;
  }
}

/// id : 1736
/// type : "support"
/// title : "Регистрация в МФЦА"

class Project {
  Project({
    num? id,
    String? type,
    String? title,
  }) {
    _id = id;
    _type = type;
    _title = title;
  }

  Project.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _title = json['title'];
  }
  num? _id;
  String? _type;
  String? _title;
  Project copyWith({
    num? id,
    String? type,
    String? title,
  }) =>
      Project(
        id: id ?? _id,
        type: type ?? _type,
        title: title ?? _title,
      );
  num? get id => _id;
  String? get type => _type;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['title'] = _title;
    return map;
  }
}

/// id : 224
/// title : "🔑 Регистрация в МФЦА"

class Form {
  Form({
    num? id,
    String? title,
  }) {
    _id = id;
    _title = title;
  }

  Form.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
  }
  num? _id;
  String? _title;
  Form copyWith({
    num? id,
    String? title,
  }) =>
      Form(
        id: id ?? _id,
        title: title ?? _title,
      );
  num? get id => _id;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    return map;
  }
}

/// id : 2945
/// last_name : "Бахретдинов"
/// first_name : "Серик"
/// patronymic : "Кувантаевич"

class Customer {
  Customer({
    num? id,
    String? lastName,
    String? firstName,
    String? patronymic,
  }) {
    _id = id;
    _lastName = lastName;
    _firstName = firstName;
    _patronymic = patronymic;
  }

  Customer.fromJson(dynamic json) {
    _id = json['id'];
    _lastName = json['last_name'];
    _firstName = json['first_name'];
    _patronymic = json['patronymic'];
  }
  num? _id;
  String? _lastName;
  String? _firstName;
  String? _patronymic;
  Customer copyWith({
    num? id,
    String? lastName,
    String? firstName,
    String? patronymic,
  }) =>
      Customer(
        id: id ?? _id,
        lastName: lastName ?? _lastName,
        firstName: firstName ?? _firstName,
        patronymic: patronymic ?? _patronymic,
      );
  num? get id => _id;
  String? get lastName => _lastName;
  String? get firstName => _firstName;
  String? get patronymic => _patronymic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['last_name'] = _lastName;
    map['first_name'] = _firstName;
    map['patronymic'] = _patronymic;
    return map;
  }
}

/// id : 2490
/// photo : "/static/uploads/image/4e/21/4e2189a5dc88427d82b97f4cb2eff6d2.jpg"
/// sip_id : null
/// username : "sirozhiddin_nuriddinov"
/// last_name : "Nuriddinov"
/// first_name : "Sirozhiddin"
/// patronymic : "qwe"
/// display_name : "Sirozhiddin Nuriddinov"

class Author {
  Author({
    num? id,
    String? photo,
    dynamic sipId,
    String? username,
    String? lastName,
    String? firstName,
    String? patronymic,
    String? displayName,
  }) {
    _id = id;
    _photo = photo;
    _sipId = sipId;
    _username = username;
    _lastName = lastName;
    _firstName = firstName;
    _patronymic = patronymic;
    _displayName = displayName;
  }

  Author.fromJson(dynamic json) {
    _id = json['id'];
    _photo = json['photo'];
    _sipId = json['sip_id'];
    _username = json['username'];
    _lastName = json['last_name'];
    _firstName = json['first_name'];
    _patronymic = json['patronymic'];
    _displayName = json['display_name'];
  }
  num? _id;
  String? _photo;
  dynamic _sipId;
  String? _username;
  String? _lastName;
  String? _firstName;
  String? _patronymic;
  String? _displayName;
  Author copyWith({
    num? id,
    String? photo,
    dynamic sipId,
    String? username,
    String? lastName,
    String? firstName,
    String? patronymic,
    String? displayName,
  }) =>
      Author(
        id: id ?? _id,
        photo: photo ?? _photo,
        sipId: sipId ?? _sipId,
        username: username ?? _username,
        lastName: lastName ?? _lastName,
        firstName: firstName ?? _firstName,
        patronymic: patronymic ?? _patronymic,
        displayName: displayName ?? _displayName,
      );
  num? get id => _id;
  String? get photo => _photo;
  dynamic get sipId => _sipId;
  String? get username => _username;
  String? get lastName => _lastName;
  String? get firstName => _firstName;
  String? get patronymic => _patronymic;
  String? get displayName => _displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['photo'] = _photo;
    map['sip_id'] = _sipId;
    map['username'] = _username;
    map['last_name'] = _lastName;
    map['first_name'] = _firstName;
    map['patronymic'] = _patronymic;
    map['display_name'] = _displayName;
    return map;
  }
}
