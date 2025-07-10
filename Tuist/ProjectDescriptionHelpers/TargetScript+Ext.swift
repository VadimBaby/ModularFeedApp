import ProjectDescription

extension TargetScript {
    public static func swiftlint(
        path: Path = Scripts.swiftlint.path,
        countInnerFolder: Int = 0,
        basedOnDependencyAnalysis: Bool = false
    ) -> Self {
        var argument = "../../.swiftlint.yml"
        
        if countInnerFolder > 0 {
            (1...countInnerFolder).forEach { _ in
                argument = "../" + argument
            }
        }
        
        return .pre(
            path: path,
            arguments: [argument],
            name: Scripts.swiftlint.title,
            basedOnDependencyAnalysis: basedOnDependencyAnalysis
        )
    }
    
    public static func swiftgen(
        path: Path = Scripts.swiftgen.path,
        basedOnDependencyAnalysis: Bool = false
    ) -> Self {
        .pre(
            path: path,
            arguments: [],
            name: Scripts.swiftgen.title,
            basedOnDependencyAnalysis: basedOnDependencyAnalysis
        )
    }
}
