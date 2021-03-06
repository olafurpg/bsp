package ch.epfl.scala.bsp4j

import java.util.List
import com.google.gson.annotations.JsonAdapter
import org.eclipse.lsp4j.jsonrpc.json.adapters.JsonElementTypeAdapter
import org.eclipse.lsp4j.jsonrpc.validation.NonNull
import org.eclipse.lsp4j.generator.JsonRpcData

@JsonRpcData
class TextDocumentIdentifier {

  @NonNull String uri

  new (@NonNull String uri) {
    this.uri = uri
  }
}

@JsonRpcData
class BuildTargetIdentifier {

  @NonNull String uri

  new (@NonNull String uri) {
    this.uri = uri
  }
}

@JsonRpcData
class BuildTargetCapabilities {

  @NonNull Boolean canCompile
  @NonNull Boolean canTest
  @NonNull Boolean canRun

  new (Boolean canCompile, Boolean canTest, Boolean canRun) {
    this.canCompile = canCompile
    this.canTest = canTest
    this.canRun = canRun
  }
}

@JsonRpcData
class BuildTarget {

  @NonNull BuildTargetIdentifier id
  String displayName
  @NonNull BuildTargetKind kind
  List<String> languageIds
  List<BuildTargetIdentifier> dependencies
  @NonNull BuildTargetCapabilities capabilities
  @JsonAdapter(JsonElementTypeAdapter.Factory) Object data

  new (@NonNull BuildTargetIdentifier id, @NonNull BuildTargetKind kind, @NonNull BuildTargetCapabilities capabilities) {
    this.id = id
    this.kind = kind
    this.capabilities = capabilities
  }
}

@JsonRpcData
class InitializeBuildParams {
  @NonNull String rootUri
  @NonNull BuildClientCapabilities capabilities

  new(@NonNull String rootUri, @NonNull BuildClientCapabilities capabilities) {
    this.rootUri = rootUri
    this.capabilities = capabilities
  }
}


@JsonRpcData
class BuildClientCapabilities {
  @NonNull List<String> languageIds
  @NonNull Boolean providesFileWatching
  new(@NonNull List<String> languageIds, @NonNull Boolean providesFileWatching) {
    this.languageIds = languageIds
    this.providesFileWatching = providesFileWatching
  }
}


@JsonRpcData
class CompileProvider {
  List<String> languageIds
}

@JsonRpcData
class TestProvider {
  List<String> languageIds
}

@JsonRpcData
class RunProvider {
  List<String> languageIds
}

@JsonRpcData
class BuildServerCapabilities {
  CompileProvider compileProvider
  TestProvider testProvider
  RunProvider runProvider
  Boolean textDocumentBuildTargetsProvider
  Boolean dependencySourcesProvider
  Boolean resourcesProvider
  Boolean buildTargetChangedProvider
}

@JsonRpcData
class InitializeBuildResult {
  @NonNull BuildServerCapabilities capabilities
  new(@NonNull BuildServerCapabilities capabilities) {
    this.capabilities = capabilities
  }
}

@JsonRpcData
class TaskId {
  @NonNull String id
  String parent
  new(@NonNull String id) {
    this.id = id
  }
}


@JsonRpcData
class ShowMessageParams {
  @NonNull MessageType type
  TaskId task
  String originId
  @NonNull String message
  new(@NonNull MessageType type, @NonNull String message) {
    this.type = type
    this.message = message
  }
}

@JsonRpcData
class LogMessageParams {
  @NonNull MessageType type
  TaskId task
  String originId
  @NonNull String message
  new(@NonNull MessageType type, @NonNull String message) {
    this.type = type
    this.message = message
  }
}

@JsonRpcData
class Position {
  @NonNull Integer line
  @NonNull Integer character
  new(@NonNull Integer line, @NonNull Integer character) {
    this.line = line
    this.character = character
  }
}

@JsonRpcData
class Range {
  @NonNull Position start
  @NonNull Position end
  new(@NonNull Position start, @NonNull Position end) {
    this.start = start
    this.end = end
  }
}

@JsonRpcData
class Location {
  @NonNull String uri
  @NonNull Range range
  new(@NonNull String uri, @NonNull Range range) {
    this.uri = uri
    this.range = range
  }
}

@JsonRpcData
class DiagnosticRelatedInformation {
  @NonNull Location location
  @NonNull String message
  new(@NonNull Location location, @NonNull String message) {
    this.location = location
    this.message = message
  }
}

@JsonRpcData
class Diagnostic {
  @NonNull Range range
  DiagnosticSeverity severity
  String code
  String source
  @NonNull String message
  DiagnosticRelatedInformation relatedInformation
  new(@NonNull Range range, @NonNull String message) {
    this.range = range
    this.message = message
  }
}

@JsonRpcData
class PublishDiagnosticsParams {
  @NonNull TextDocumentIdentifier textDocument
  @NonNull BuildTargetIdentifier buildTarget
  String originId
  List<Diagnostic> diagnostics
  new(@NonNull TextDocumentIdentifier textDocument, @NonNull BuildTargetIdentifier buildTarget) {
    this.textDocument = textDocument
    this.buildTarget = buildTarget
  }
}

@JsonRpcData
class WorkspaceBuildTargetsResult {
  List<BuildTarget> targets
  new(@NonNull List<BuildTarget> targets) {
    this.targets = targets
  }
}

@JsonRpcData
class RegisterFileWatcherParams {
  @NonNull String globPattern
  WatchKind kind
  new(@NonNull String globPattern) {
    this.globPattern = globPattern
  }
}

@JsonRpcData
class RegisterFileWatcherResult {
  @NonNull String id
  new(@NonNull String id) {
    this.id = id
  }
}

@JsonRpcData
class DidChangeWatchedFiles {
  List<FileEvent> changes
  new(@NonNull List<FileEvent> changes) {
    this.changes = changes
  }
}

@JsonRpcData
class FileEvent {
  @NonNull String uri
  @NonNull FileChangeType type
  new(@NonNull String uri, @NonNull FileChangeType type) {
    this.uri = uri
    this.type = type
  }
}

@JsonRpcData
class CancelFileWatcherParams {
  @NonNull String id
  new(@NonNull String id) {
    this.id = id
  }
}

@JsonRpcData
class CancelFileWatcherResult {
  @NonNull Boolean cancelled
  new(@NonNull Boolean cancelled) {
    this.cancelled = cancelled
  }
}

@JsonRpcData
class DidChangeBuildTarget {
  @NonNull List<BuildTargetEvent> changes
  new(@NonNull List<BuildTargetEvent> changes) {
    this.changes = changes
  }
}

@JsonRpcData
class BuildTargetEvent {
  @NonNull String uri
  BuildTargetEventKind kind
  @JsonAdapter(JsonElementTypeAdapter.Factory) Object data
  new(@NonNull String uri) {
    this.uri = uri
  }
}

@JsonRpcData
class BuildTargetTextDocumentsParams {
  @NonNull List<BuildTargetIdentifier> targets
  new(@NonNull List<BuildTargetIdentifier> targets) {
    this.targets = targets
  }
}

@JsonRpcData
class BuildTargetTextDocumentsResult {
  @NonNull List<TextDocumentIdentifier> textDocuments
  new(@NonNull List<TextDocumentIdentifier> textDocuments) {
    this.textDocuments = textDocuments
  }
}

@JsonRpcData
class TextDocumentBuildTargetsParams {
  @NonNull List<TextDocumentIdentifier> textDocuments
  new(@NonNull List<TextDocumentIdentifier> textDocuments) {
    this.textDocuments = textDocuments
  }
}

@JsonRpcData
class TextDocumentBuildTargetsResult {
  @NonNull List<BuildTargetIdentifier> targets
  new(@NonNull List<BuildTargetIdentifier> targets) {
    this.targets = targets
  }
}

@JsonRpcData
class DependencySourcesParams {
  @NonNull List<BuildTargetIdentifier> targets
  new(@NonNull List<BuildTargetIdentifier> targets) {
    this.targets = targets
  }
}

@JsonRpcData
class DependencySourcesResult {
  @NonNull List<DependencySourcesItem> items
  new(@NonNull List<DependencySourcesItem> items) {
    this.items = items
  }
}
@JsonRpcData
class DependencySourcesItem {
  @NonNull BuildTargetIdentifier target
  @NonNull List<String> sources
  new(@NonNull BuildTargetIdentifier target, @NonNull List<String> sources) {
    this.target = target
    this.sources = sources
  }
}

@JsonRpcData
class ResourcesParams {
  @NonNull List<BuildTargetIdentifier> targets
  new(@NonNull List<BuildTargetIdentifier> targets) {
    this.targets = targets
  }
}

@JsonRpcData
class ResourcesResult {
  @NonNull List<ResourcesItem> items
  new(@NonNull List<ResourcesItem> items) {
    this.items = items
  }
}
@JsonRpcData
class ResourcesItem {
  @NonNull List<BuildTargetIdentifier> targets
  @NonNull List<String> resources
  new(@NonNull List<BuildTargetIdentifier> targets, @NonNull List<String> resources) {
    this.targets = targets
    this.resources = resources
  }
}

@JsonRpcData
class CompileParams {
  @NonNull List<BuildTargetIdentifier> targets
  String originId
  @JsonAdapter(JsonElementTypeAdapter.Factory) Object arguments
  new(@NonNull List<BuildTargetIdentifier> targets) {
    this.targets = targets
  }
}

@JsonRpcData
class CompileResult {
  String originId
  @JsonAdapter(JsonElementTypeAdapter.Factory) Object data
}

@JsonRpcData
class CompileReport {
  @NonNull BuildTargetIdentifier target
  String originId
  @NonNull Integer errors
  @NonNull Integer warnings
  Long time
  new(@NonNull BuildTargetIdentifier target, Integer errors, Integer warnings) {
    this.target = target
    this.errors = errors
    this.warnings = warnings
  }
}

@JsonRpcData
class TestParams {
  @NonNull List<BuildTargetIdentifier> targets
  String originId
  @JsonAdapter(JsonElementTypeAdapter.Factory) Object arguments
  new(@NonNull List<BuildTargetIdentifier> targets) {
    this.targets = targets
  }
}

@JsonRpcData
class TestResult {
  String originId
  @JsonAdapter(JsonElementTypeAdapter.Factory) Object data
}

@JsonRpcData
class TestReport {
  @NonNull BuildTargetIdentifier target
  String originId
  @NonNull Integer passed
  @NonNull Integer failed
  @NonNull Integer ignored
  @NonNull Integer cancelled
  @NonNull Integer skipped
  Long time
  new(@NonNull BuildTargetIdentifier target, Integer passed, Integer failed, Integer ignored,
      Integer cancelled, Integer skipped) {
    this.target = target
    this.passed = passed
    this.failed = failed
    this.ignored = ignored
    this.cancelled = cancelled
    this.skipped = skipped
  }
}

@JsonRpcData
class RunParams {
  @NonNull BuildTargetIdentifier target
  String originId
  @JsonAdapter(JsonElementTypeAdapter.Factory) Object arguments
  new(@NonNull BuildTargetIdentifier target) {
    this.target = target
  }
}

@JsonRpcData
class RunResult {
  String originId
  @NonNull StatusCode statusCode
  new(@NonNull StatusCode statusCode) {
    this.statusCode = statusCode
  }
}
