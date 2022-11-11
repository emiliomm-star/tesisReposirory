class PolilinesProvider {
    PolilinesProvider({
        required this.hints,
        required this.info,
        required this.paths,
    });

    final Hints? hints;
    final Info? info;
    final List<Path> paths;

    factory PolilinesProvider.fromJson(Map<String, dynamic> json){ 
        return PolilinesProvider(
        hints: json["hints"] == null ? null : Hints.fromJson(json["hints"]),
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        paths: json["paths"] == null ? [] : List<Path>.from(json["paths"]!.map((x) => Path.fromJson(x))),
    );
    }

}

class Hints {
    Hints({
        required this.visitedNodesSum,
        required this.visitedNodesAverage,
    });

    final int? visitedNodesSum;
    final int? visitedNodesAverage;

    factory Hints.fromJson(Map<String, dynamic> json){ 
        return Hints(
        visitedNodesSum: json["visited_nodes.sum"],
        visitedNodesAverage: json["visited_nodes.average"],
    );
    }

}

class Info {
    Info({
        required this.copyrights,
        required this.took,
    });

    final List<String> copyrights;
    final int? took;

    factory Info.fromJson(Map<String, dynamic> json){ 
        return Info(
        copyrights: json["copyrights"] == null ? [] : List<String>.from(json["copyrights"]!.map((x) => x)),
        took: json["took"],
    );
    }

}

class Path {
    Path({
        required this.distance,
        required this.weight,
        required this.time,
        required this.transfers,
        required this.pointsEncoded,
        required this.bbox,
        required this.points,
        required this.instructions,
        required this.legs,
        required this.details,
        required this.ascend,
        required this.descend,
        required this.snappedWaypoints,
    });

    final double? distance;
    final double? weight;
    final int? time;
    final int? transfers;
    final bool? pointsEncoded;
    final List<double> bbox;
    final Points? points;
    final List<Instruction> instructions;
    final List<dynamic> legs;
    final Details? details;
    final double? ascend;
    final double? descend;
    final Points? snappedWaypoints;

    factory Path.fromJson(Map<String, dynamic> json){ 
        return Path(
        distance: json["distance"],
        weight: json["weight"],
        time: json["time"],
        transfers: json["transfers"],
        pointsEncoded: json["points_encoded"],
        bbox: json["bbox"] == null ? [] : List<double>.from(json["bbox"]!.map((x) => x)),
        points: json["points"] == null ? null : Points.fromJson(json["points"]),
        instructions: json["instructions"] == null ? [] : List<Instruction>.from(json["instructions"]!.map((x) => Instruction.fromJson(x))),
        legs: json["legs"] == null ? [] : List<dynamic>.from(json["legs"]!.map((x) => x)),
        details: json["details"] == null ? null : Details.fromJson(json["details"]),
        ascend: json["ascend"],
        descend: json["descend"],
        snappedWaypoints: json["snapped_waypoints"] == null ? null : Points.fromJson(json["snapped_waypoints"]),
    );
    }

}

class Details {
    Details();

    factory Details.fromJson(Map<String, dynamic> json){ 
        return Details(
    );
    }

}

class Instruction {
    Instruction({
        required this.distance,
        required this.heading,
        required this.sign,
        required this.interval,
        required this.text,
        required this.time,
        required this.streetName,
        required this.streetRef,
        required this.streetDestination,
        required this.streetDestinationRef,
        required this.exitNumber,
        required this.exited,
        required this.turnAngle,
        required this.lastHeading,
    });

    final double? distance;
    final double? heading;
    final int? sign;
    final List<int> interval;
    final String? text;
    final int? time;
    final String? streetName;
    final String? streetRef;
    final String? streetDestination;
    final String? streetDestinationRef;
    final int? exitNumber;
    final bool? exited;
    final double? turnAngle;
    final double? lastHeading;

    factory Instruction.fromJson(Map<String, dynamic> json){ 
        return Instruction(
        distance: json["distance"],
        heading: json["heading"],
        sign: json["sign"],
        interval: json["interval"] == null ? [] : List<int>.from(json["interval"]!.map((x) => x)),
        text: json["text"],
        time: json["time"],
        streetName: json["street_name"],
        streetRef: json["street_ref"],
        streetDestination: json["street_destination"],
        streetDestinationRef: json["street_destination_ref"],
        exitNumber: json["exit_number"],
        exited: json["exited"],
        turnAngle: json["turn_angle"],
        lastHeading: json["last_heading"],
    );
    }

}

class Points {
    Points({
        required this.type,
        required this.coordinates,
    });

    final String? type;
    final List<List<double>> coordinates;

    factory Points.fromJson(Map<String, dynamic> json){ 
        return Points(
        type: json["type"],
        coordinates: json["coordinates"] == null ? [] : List<List<double>>.from(json["coordinates"]!.map((x) => x == null ? [] : List<double>.from(x!.map((x) => x)))),
    );
    }

}
