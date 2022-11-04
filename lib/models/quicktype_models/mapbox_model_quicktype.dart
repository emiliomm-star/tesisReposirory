class MapboxModel {
    MapboxModel({
        required this.routes,
        required this.waypoints,
        required this.code,
        required this.uuid,
    });

    final List<Route> routes;
    final List<Waypoint> waypoints;
    final String? code;
    final String? uuid;

    factory MapboxModel.fromJson(Map<String, dynamic> json){ 
        return MapboxModel(
        routes: json["routes"] == null ? [] : List<Route>.from(json["routes"]!.map((x) => Route.fromJson(x))),
        waypoints: json["waypoints"] == null ? [] : List<Waypoint>.from(json["waypoints"]!.map((x) => Waypoint.fromJson(x))),
        code: json["code"],
        uuid: json["uuid"],
    );
    }

    Map<String, dynamic> toJson() => {
        "routes": List<Route>.from(routes.map((x) => x.toJson())),
        "waypoints": List<Waypoint>.from(waypoints.map((x) => x.toJson())),
        "code": code,
        "uuid": uuid,
    };

}

class Route {
    Route({
        required this.countryCrossed,
        required this.weightName,
        required this.weight,
        required this.duration,
        required this.distance,
        required this.legs,
        required this.geometry,
    });

    final bool? countryCrossed;
    final String? weightName;
    final double? weight;
    final double? duration;
    final double? distance;
    final List<Leg> legs;
    final String? geometry;

    factory Route.fromJson(Map<String, dynamic> json){ 
        return Route(
        countryCrossed: json["country_crossed"],
        weightName: json["weight_name"],
        weight: json["weight"],
        duration: json["duration"],
        distance: json["distance"],
        legs: json["legs"] == null ? [] : List<Leg>.from(json["legs"]!.map((x) => Leg.fromJson(x))),
        geometry: json["geometry"],
    );
    }

    Map<String, dynamic> toJson() => {
        "country_crossed": countryCrossed,
        "weight_name": weightName,
        "weight": weight,
        "duration": duration,
        "distance": distance,
        "legs": List<Leg>.from(legs.map((x) => x.toJson())),
        "geometry": geometry,
    };

}

class Leg {
    Leg({
        required this.viaWaypoints,
        required this.annotation,
        required this.admins,
        required this.weight,
        required this.duration,
        required this.steps,
        required this.distance,
        required this.summary,
    });

    final List<dynamic> viaWaypoints;
    final Annotation? annotation;
    final List<Admin> admins;
    final double? weight;
    final double? duration;
    final List<Step> steps;
    final double? distance;
    final String? summary;

    factory Leg.fromJson(Map<String, dynamic> json){ 
        return Leg(
        viaWaypoints: json["via_waypoints"] == null ? [] : List<dynamic>.from(json["via_waypoints"]!.map((x) => x)),
        annotation: json["annotation"] == null ? null : Annotation.fromJson(json["annotation"]),
        admins: json["admins"] == null ? [] : List<Admin>.from(json["admins"]!.map((x) => Admin.fromJson(x))),
        weight: json["weight"],
        duration: json["duration"],
        steps: json["steps"] == null ? [] : List<Step>.from(json["steps"]!.map((x) => Step.fromJson(x))),
        distance: json["distance"],
        summary: json["summary"],
    );
    }

    Map<String, dynamic> toJson() => {
        "via_waypoints": List<dynamic>.from(viaWaypoints.map((x) => x)),
        "annotation": annotation?.toJson(),
        "admins": List<Admin>.from(admins.map((x) => x.toJson())),
        "weight": weight,
        "duration": duration,
        "steps": List<Step>.from(steps.map((x) => x.toJson())),
        "distance": distance,
        "summary": summary,
    };

}

class Admin {
    Admin({
        required this.iso31661Alpha3,
        required this.iso31661,
    });

    final String? iso31661Alpha3;
    final String? iso31661;

    factory Admin.fromJson(Map<String, dynamic> json){ 
        return Admin(
        iso31661Alpha3: json["iso_3166_1_alpha3"],
        iso31661: json["iso_3166_1"],
    );
    }

    Map<String, dynamic> toJson() => {
        "iso_3166_1_alpha3": iso31661Alpha3,
        "iso_3166_1": iso31661,
    };

}

class Annotation {
    Annotation({
        required this.distance,
        required this.duration,
    });

    final List<double> distance;
    final List<double> duration;

    factory Annotation.fromJson(Map<String, dynamic> json){ 
        return Annotation(
        distance: json["distance"] == null ? [] : List<double>.from(json["distance"]!.map((x) => x)),
        duration: json["duration"] == null ? [] : List<double>.from(json["duration"]!.map((x) => x)),
    );
    }

    Map<String, dynamic> toJson() => {
        "distance": List<double>.from(distance.map((x) => x)),
        "duration": List<double>.from(duration.map((x) => x)),
    };

}

class Step {
    Step({
        required this.intersections,
        required this.maneuver,
        required this.name,
        required this.duration,
        required this.distance,
        required this.drivingSide,
        required this.weight,
        required this.mode,
        required this.geometry,
        required this.ref,
    });

    final List<Intersection> intersections;
    final Maneuver? maneuver;
    final String? name;
    final double? duration;
    final double? distance;
    final String? drivingSide;
    final double? weight;
    final String? mode;
    final String? geometry;
    final String? ref;

    factory Step.fromJson(Map<String, dynamic> json){ 
        return Step(
        intersections: json["intersections"] == null ? [] : List<Intersection>.from(json["intersections"]!.map((x) => Intersection.fromJson(x))),
        maneuver: json["maneuver"] == null ? null : Maneuver.fromJson(json["maneuver"]),
        name: json["name"],
        duration: json["duration"],
        distance: json["distance"],
        drivingSide: json["driving_side"],
        weight: json["weight"],
        mode: json["mode"],
        geometry: json["geometry"],
        ref: json["ref"],
    );
    }

    Map<String, dynamic> toJson() => {
        "intersections": List<Intersection>.from(intersections.map((x) => x.toJson())),
        "maneuver": maneuver?.toJson(),
        "name": name,
        "duration": duration,
        "distance": distance,
        "driving_side": drivingSide,
        "weight": weight,
        "mode": mode,
        "geometry": geometry,
        "ref": ref,
    };

}

class Intersection {
    Intersection({
        required this.bearings,
        required this.entry,
        required this.mapboxStreetsV8,
        required this.isUrban,
        required this.adminIndex,
        required this.out,
        required this.geometryIndex,
        required this.location,
        required this.intersectionIn,
        required this.duration,
        required this.turnWeight,
        required this.turnDuration,
        required this.weight,
    });

    final List<int> bearings;
    final List<bool> entry;
    final MapboxStreetsV8? mapboxStreetsV8;
    final bool? isUrban;
    final int? adminIndex;
    final int? out;
    final int? geometryIndex;
    final List<double> location;
    final int? intersectionIn;
    final double? duration;
    final double? turnWeight;
    final double? turnDuration;
    final double? weight;

    factory Intersection.fromJson(Map<String, dynamic> json){ 
        return Intersection(
        bearings: json["bearings"] == null ? [] : List<int>.from(json["bearings"]!.map((x) => x)),
        entry: json["entry"] == null ? [] : List<bool>.from(json["entry"]!.map((x) => x)),
        mapboxStreetsV8: json["mapbox_streets_v8"] == null ? null : MapboxStreetsV8.fromJson(json["mapbox_streets_v8"]),
        isUrban: json["is_urban"],
        adminIndex: json["admin_index"],
        out: json["out"],
        geometryIndex: json["geometry_index"],
        location: json["location"] == null ? [] : List<double>.from(json["location"]!.map((x) => x)),
        intersectionIn: json["in"],
        duration: json["duration"],
        turnWeight: json["turn_weight"],
        turnDuration: json["turn_duration"],
        weight: json["weight"],
    );
    }

    Map<String, dynamic> toJson() => {
        "bearings": List<int>.from(bearings.map((x) => x)),
        "entry": List<bool>.from(entry.map((x) => x)),
        "mapbox_streets_v8": mapboxStreetsV8?.toJson(),
        "is_urban": isUrban,
        "admin_index": adminIndex,
        "out": out,
        "geometry_index": geometryIndex,
        "location": List<double>.from(location.map((x) => x)),
        "in": intersectionIn,
        "duration": duration,
        "turn_weight": turnWeight,
        "turn_duration": turnDuration,
        "weight": weight,
    };

}

class MapboxStreetsV8 {
    MapboxStreetsV8({
        required this.mapboxStreetsV8Class,
    });

    final String? mapboxStreetsV8Class;

    factory MapboxStreetsV8.fromJson(Map<String, dynamic> json){ 
        return MapboxStreetsV8(
        mapboxStreetsV8Class: json["class"],
    );
    }

    Map<String, dynamic> toJson() => {
        "class": mapboxStreetsV8Class,
    };

}

class Maneuver {
    Maneuver({
        required this.type,
        required this.instruction,
        required this.bearingAfter,
        required this.bearingBefore,
        required this.location,
        required this.modifier,
    });

    final String? type;
    final String? instruction;
    final int? bearingAfter;
    final int? bearingBefore;
    final List<double> location;
    final String? modifier;

    factory Maneuver.fromJson(Map<String, dynamic> json){ 
        return Maneuver(
        type: json["type"],
        instruction: json["instruction"],
        bearingAfter: json["bearing_after"],
        bearingBefore: json["bearing_before"],
        location: json["location"] == null ? [] : List<double>.from(json["location"]!.map((x) => x)),
        modifier: json["modifier"],
    );
    }

    Map<String, dynamic> toJson() => {
        "type": type,
        "instruction": instruction,
        "bearing_after": bearingAfter,
        "bearing_before": bearingBefore,
        "location": List<double>.from(location.map((x) => x)),
        "modifier": modifier,
    };

}

class Waypoint {
    Waypoint({
        required this.distance,
        required this.name,
        required this.location,
    });

    final double? distance;
    final String? name;
    final List<double> location;

    factory Waypoint.fromJson(Map<String, dynamic> json){ 
        return Waypoint(
        distance: json["distance"],
        name: json["name"],
        location: json["location"] == null ? [] : List<double>.from(json["location"]!.map((x) => x)),
    );
    }

    Map<String, dynamic> toJson() => {
        "distance": distance,
        "name": name,
        "location": List<double>.from(location.map((x) => x)),
    };

}
