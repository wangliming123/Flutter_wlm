//订阅者回调签名
typedef void EventCallback(arg);

//定义一个top-level变量，页面引入该文件后可直接使用bus
var bus = new EventBus();

// Dart中实现单例模式的标准做法就是使⽤static变量+⼯⼚构造函数的⽅式，
// 这样就可以保证 new EventBus()  始终返回都是同⼀个实例
class EventBus {
  //私有构造函数
  EventBus._internal();

  //保存单例
  static EventBus _singleton = EventBus._internal();

  //工厂构造函数
  factory EventBus() => _singleton;

  //保存事件订阅者队列，key:事件名(id), value:对应事件的订阅者队列
  var _eventMap = new Map<Object, List<EventCallback>>();

  //添加订阅者
  void on(eventName, EventCallback f) {
    if (eventName == null || f == null) return;
    _eventMap[eventName] ??= new List<EventCallback>();
    _eventMap[eventName].add(f);
  }

  //移除订阅者
  void off(eventName, [EventCallback f]) {
    var list = _eventMap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _eventMap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  //触发事件，事件触发后该事件的所有订阅者会被调用
  void emit(eventName, [arg]) {
    var list = _eventMap[eventName];
    if (list == null) return;
    //反向遍历，防⽌在订阅者在回调中移除⾃身带来的下标错位
    for (var i = list.length - 1; i > -1; i--) {
      list[i](arg);
    }
  }
}

