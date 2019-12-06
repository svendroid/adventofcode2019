class Day6 {
  int orbitMapChecksum(String orbitMap) {
    var objects = buildSpaceObjects(orbitMap);

    //objects.entries.forEach((entry) => print(entry.value));

    var sum = objects.entries
        .map((entry) => entry.value.checksum())
        .reduce((value, element) => value + element);

    return sum;
  }

  minDistanceBetweenYouAndSanta(String orbitMap) {
    var objects = buildSpaceObjects(orbitMap);
    //print(objects['YOU']);
    var myParents = objects['YOU'].parentsWithSteps();
    //print(objects['SAN']);
    var santaParents = objects['SAN'].parentsWithSteps();

    for (var orbitName in santaParents.keys) {
      if(myParents[orbitName] != null){
        return santaParents[orbitName] + myParents[orbitName];
      };
    }
    return -1;
  }

  Map<String, Object> buildSpaceObjects(String orbitMap) {
    Map<String, Object> objects = Map();

    orbitMap.split('\n').forEach((entry) => (entry) {
          var objectNames = entry.split(')');
          var object0Name = objectNames[0];
          var object1Name = objectNames[1];

          Object object0 = objects[object0Name];
          if (object0 == null) {
            object0 = Object(object0Name, null);
            objects[object0Name] = object0;
          }
          Object object1 = objects[object1Name];
          if (object1 == null) {
            object1 = Object(object1Name, object0);
            objects[object1Name] = object1;
          } else {
            object1.parent = object0;
          }
        }(entry));

    return objects;
  }
}

class Object {
  String name;
  Object _parent;
  List<Object> children = [];

  int orbitsIndirectCount = 0;

  Object(this.name, this._parent) {
    if (this._parent != null) {
      this._parent.children.add(this);
    }
  }

  set parent(parent) {
    this._parent = parent;
    this._parent.children.add(this);
  }

  int checksum() {
    if (_parent == null) {
      return 0;
    } else {
      return _parent.checksum() + 1;
    }
  }

  Map<String, int> parentsWithSteps(){
    Map<String, int> parents = Map();
    var tempParent = this._parent;
    int orbitCounter = 0;
    while(tempParent != null){
      parents[tempParent.name] = orbitCounter;
      tempParent = tempParent._parent;
      orbitCounter += 1;
    }
    return parents;
  }

  @override
  String toString() {
    return '$name orbits $_parent';
  }
}
