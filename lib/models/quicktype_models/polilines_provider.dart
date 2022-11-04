class PolilinesProvider {
    PolilinesProvider({
        required this.type,
        required this.features,
        required this.bbox,
        required this.metadata,
    });

    final String? type;
    final List<Feature> features;
    final List<double> bbox;
    final Metadata? metadata;

    factory PolilinesProvider.fromJson(Map<String, dynamic> json){ 
        return PolilinesProvider(
        type: json["type"],
        features: json["features"] == null ? [] : List<Feature>.from(json["features"]!.map((x) => Feature.fromJson(x))),
        bbox: json["bbox"] == null ? [] : List<double>.from(json["bbox"]!.map((x) => x)),
        metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
    );
    }

    Map<String, dynamic> toJson() => {
        "type": type,
        "features": List<Feature>.from(features.map((x) => x.toJson())),
        "bbox": List<double>.from(bbox.map((x) => x)),
        "metadata": metadata?.toJson(),
    };

}

class Feature {
    Feature({
        required this.bbox,
        required this.type,
        required this.properties,
        required this.geometry,
    });

    final List<double> bbox;
    final String? type;
    final Properties? properties;
    final Geometry? geometry;

    factory Feature.fromJson(Map<String, dynamic> json){ 
        return Feature(
        bbox: json["bbox"] == null ? [] : List<double>.from(json["bbox"]!.map((x) => x)),
        type: json["type"],
        properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
        geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
    );
    }

    Map<String, dynamic> toJson() => {
        "bbox": List<double>.from(bbox.map((x) => x)),
        "type": type,
        "properties": properties?.toJson(),
        "geometry": geometry?.toJson(),
    };

}

class Geometry {
    Geometry({
        required this.coordinates,
        required this.type,
    });

    final List<List<double>> coordinates;
    final String? type;

    factory Geometry.fromJson(Map<String, dynamic> json){ 
        return Geometry(
        coordinates: json["coordinates"] == null ? [] : List<List<double>>.from(json["coordinates"]!.map((x) => x == null ? [] : List<double>.from(x!.map((x) => x)))),
        type: json["type"],
    );
    }

    Map<String, dynamic> toJson() => {
        "coordinates": List<List<double>>.from(coordinates.map((x) => List<double>.from(x.map((x) => x)))),
        "type": type,
    };

}

class Properties {
    Properties({
        required this.segments,
        required this.summary,
        required this.wayPoints,
    });

    final List<Segment> segments;
    final Summary? summary;
    final List<int> wayPoints;

    factory Properties.fromJson(Map<String, dynamic> json){ 
        return Properties(
        segments: json["segments"] == null ? [] : List<Segment>.from(json["segments"]!.map((x) => Segment.fromJson(x))),
        summary: json["summary"] == null ? null : Summary.fromJson(json["summary"]),
        wayPoints: json["way_points"] == null ? [] : List<int>.from(json["way_points"]!.map((x) => x)),
    );
    }

    Map<String, dynamic> toJson() => {
        "segments": List<Segment>.from(segments.map((x) => x.toJson())),
        "summary": summary?.toJson(),
        "way_points": List<int>.from(wayPoints.map((x) => x)),
    };

}

class Segment {
    Segment({
        required this.distance,
        required this.duration,
        required this.steps,
    });

    final double? distance;
    final int? duration;
    final List<Step> steps;

    factory Segment.fromJson(Map<String, dynamic> json){ 
        return Segment(
        distance: json["distance"],
        duration: json["duration"],
        steps: json["steps"] == null ? [] : List<Step>.from(json["steps"]!.map((x) => Step.fromJson(x))),
    );
    }

    Map<String, dynamic> toJson() => {
        "distance": distance,
        "duration": duration,
        "steps": List<Step>.from(steps.map((x) => x.toJson())),
    };

}

class Step {
    Step({
        required this.distance,
        required this.duration,
        required this.type,
        required this.instruction,
        required this.name,
        required this.wayPoints,
    });

    final double? distance;
    final double? duration;
    final int? type;
    final String? instruction;
    final String? name;
    final List<int> wayPoints;

    factory Step.fromJson(Map<String, dynamic> json){ 
        return Step(
        distance: json["distance"],
        duration: json["duration"],
        type: json["type"],
        instruction: json["instruction"],
        name: json["name"],
        wayPoints: json["way_points"] == null ? [] : List<int>.from(json["way_points"]!.map((x) => x)),
    );
    }

    Map<String, dynamic> toJson() => {
        "distance": distance,
        "duration": duration,
        "type": type,
        "instruction": instruction,
        "name": name,
        "way_points": List<int>.from(wayPoints.map((x) => x)),
    };

}

class Summary {
    Summary({
        required this.distance,
        required this.duration,
    });

    final double? distance;
    final int? duration;

    factory Summary.fromJson(Map<String, dynamic> json){ 
        return Summary(
        distance: json["distance"],
        duration: json["duration"],
    );
    }

    Map<String, dynamic> toJson() => {
        "distance": distance,
        "duration": duration,
    };

}

class Metadata {
    Metadata({
        required this.attribution,
        required this.service,
        required this.timestamp,
        required this.query,
        required this.engine,
    });

    final String? attribution;
    final String? service;
    final int? timestamp;
    final Query? query;
    final Engine? engine;

    factory Metadata.fromJson(Map<String, dynamic> json){ 
        return Metadata(
        attribution: json["attribution"],
        service: json["service"],
        timestamp: json["timestamp"],
        query: json["query"] == null ? null : Query.fromJson(json["query"]),
        engine: json["engine"] == null ? null : Engine.fromJson(json["engine"]),
    );
    }

    Map<String, dynamic> toJson() => {
        "attribution": attribution,
        "service": service,
        "timestamp": timestamp,
        "query": query?.toJson(),
        "engine": engine?.toJson(),
    };

}

class Engine {
    Engine({
        required this.version,
        required this.buildDate,
        required this.graphDate,
    });

    final String? version;
    final DateTime? buildDate;
    final DateTime? graphDate;

    factory Engine.fromJson(Map<String, dynamic> json){ 
        return Engine(
        version: json["version"],
        buildDate: json["build_date"] == null ? null : DateTime.parse(json["build_date"]),
        graphDate: json["graph_date"] == null ? null : DateTime.parse(json["graph_date"]),
    );
    }

    Map<String, dynamic> toJson() => {
        "version": version,
        "build_date": buildDate?.toIso8601String(),
        "graph_date": graphDate?.toIso8601String(),
    };

}

class Query {
    Query({
        required this.coordinates,
        required this.profile,
        required this.format,
    });

    final List<List<double>> coordinates;
    final String? profile;
    final String? format;

    factory Query.fromJson(Map<String, dynamic> json){ 
        return Query(
        coordinates: json["coordinates"] == null ? [] : List<List<double>>.from(json["coordinates"]!.map((x) => x == null ? [] : List<double>.from(x!.map((x) => x)))),
        profile: json["profile"],
        format: json["format"],
    );
    }

    Map<String, dynamic> toJson() => {
        "coordinates": List<List<double>>.from(coordinates.map((x) => List<double>.from(x.map((x) => x)))),
        "profile": profile,
        "format": format,
    };

}
