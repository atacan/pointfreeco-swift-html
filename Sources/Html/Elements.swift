private func el<T>(_ name: StaticString, _ attribs: [Attribute<T>] = [], _ children: Node...) -> Node {
  return .element(String(describing: name), attribs.map { ($0.key, $0.value) }, ...children)
}

private func el(_ name: StaticString, _ children: Node...) -> Node {
  return .element(String(describing: name), [], ...children)
}

public struct ChildOf<T> {
  public let rawValue: Node
  public init(_ node: Node) {
    self.rawValue = node
  }
}

extension ChildOf {
  public static func fragment(_ children: [ChildOf]) -> ChildOf {
    return .init(...children.map { $0.rawValue })
  }
}

public prefix func ... <T>(nodes: [ChildOf<T>]) -> ChildOf<T> {
  return .fragment(nodes)
}

extension ChildOf: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: ChildOf...) {
    self = ...elements
  }
}

public enum Tag {
  public enum A {}
  public enum Abbr {}
  public enum Address {}
  public enum Area {}
  public enum Article {}
  public enum Aside {}
  public enum Audio {}
  public enum B {}
  public enum Base {}
  public enum Bdi {}
  public enum Bdo {}
  public enum Blockquote {}
  public enum Body {}
  public enum Button {}
  public enum Canvas {}
  public enum Caption {}
  public enum Cite {}
  public enum Code {}
  public enum Col {}
  public enum Colgroup {}
  public enum Dd {}
  public enum Del {}
  public enum Details {}
  public enum Dfn {}
  public enum Div {}
  public enum Dl {}
  public enum Dt {}
  public enum Em {}
  public enum Embed {}
  public enum Fieldset {}
  public enum Figcaption {}
  public enum Figure {}
  public enum Footer {}
  public enum Form {}
  public enum H1 {}
  public enum H2 {}
  public enum H3 {}
  public enum H4 {}
  public enum H5 {}
  public enum H6 {}
  public enum Head {}
  public enum Header {}
  public enum Hr {}
  public enum Html {}
  public enum I {}
  public enum Iframe {}
  public enum Img {}
  public enum Input {}
  public enum Ins {}
  public enum Kbd {}
  public enum Label {}
  public enum Legend {}
  public enum Li {}
  public enum Link {}
  public enum Main {}
  public enum Mark {}
  public enum Map {}
  public enum Meta {}
  public enum Meter {}
  public enum Nav {}
  public enum Object {}
  public enum Ol {}
  public enum Optgroup {}
  public enum Option {}
  public enum Output {}
  public enum P {}
  public enum Param {}
  public enum Picture {}
  public enum Pre {}
  public enum Progress {}
  public enum Q {}
  public enum Rp {}
  public enum Rt {}
  public enum Ruby {}
  public enum S {}
  public enum Samp {}
  public enum Script {}
  public enum Section {}
  public enum Select {}
  public enum Small {}
  public enum Source {}
  public enum Span {}
  public enum Strong {}
  public enum Style {}
  public enum Sub {}
  public enum Summary {}
  public enum Sup {}
  public enum Svg {}
  public enum Table {}
  public enum Tbody {}
  public enum Td {}
  public enum Textarea {}
  public enum Tfoot {}
  public enum Time {}
  public enum Track {}
  public enum Th {}
  public enum Thead {}
  public enum Tr {}
  public enum U {}
  public enum Ul {}
  public enum Var {}
  public enum Video {}
}

/// A sub-set of directions, valid for `<bdo>` elements.
public enum BdoDirection: String {
  /// Left-to-right.
  case ltr
  /// Right-to-left.
  case rtl
}

public enum Viewport {
  case height(Height)
  case initialScale(Double)
  case maximumScale(Double)
  case minimumScale(Double)
  case userScalable(Bool)
  case width(Width)

  public enum Height {
    case deviceHeight
    case px(Int)
  }

  public enum Width {
    case deviceWidth
    case px(Int)
  }
}

extension Viewport: CustomStringConvertible {
  public var description: String {
    switch self {
    case let .height(px):
      return "height=" + px.description
    case let .initialScale(scale):
      return "initial-scale=\(scale)"
    case let .maximumScale(scale):
      return "maximum-scale=\(scale)"
    case let .minimumScale(scale):
      return "minimum-scale=\(scale)"
    case let .userScalable(isUserScalable):
      return "user-scalable=\(isUserScalable ? "yes" : "no")"
    case let .width(px):
      return "width=" + px.description
    }
  }
}

extension Viewport.Height: CustomStringConvertible {
  public var description: String {
    switch self {
    case .deviceHeight:
      return "device-height"
    case let .px(px):
      return "\(px)"
    }
  }
}

extension Viewport.Height: ExpressibleByIntegerLiteral {
  public init(integerLiteral value: Int) {
    self = .px(value)
  }
}

extension Viewport.Width: CustomStringConvertible {
  public var description: String {
    switch self {
    case .deviceWidth:
      return "device-width"
    case let .px(px):
      return "\(px)"
    }
  }
}

extension Viewport.Width: ExpressibleByIntegerLiteral {
  public init(integerLiteral value: Int) {
    self = .px(value)
  }
}

extension Node {
  /// The `<a>` element represents either a hyperlink (a hypertext anchor) labeled by its contents, or a placeholder for where a link might otherwise have been placed, if it had been relevant, consisting of just the element's contents.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func a(_ attribs: [Attribute<Tag.A>], _ content: Node...) -> Node {
    return el("a", attribs, ...content)
  }

  /// The `<a>` element represents either a hyperlink (a hypertext anchor) labeled by its contents, or a placeholder for where a link might otherwise have been placed, if it had been relevant, consisting of just the element's contents.
  ///
  /// - Parameter content: Child nodes.
  public static func a(_ content: Node...) -> Node {
    return a([], ...content)
  }

  /// The `<abbr>` element represents an abbreviation or acronym, optionally with its expansion.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func abbr(_ attribs: [Attribute<Tag.Abbr>], _ content: Node...) -> Node {
    return el("abbr", attribs, ...content)
  }

  /// The `<abbr>` element represents an abbreviation or acronym, optionally with its expansion.
  ///
  /// - Parameter content: Child nodes.
  public static func abbr(_ content: Node...) -> Node {
    return abbr([], ...content)
  }

  /// The `<address>` element represents contact information for a person, people or organization. It should include physical and/or digital location/contact information and a means of identifying a person(s) or organization the information pertains to.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func address(_ attribs: [Attribute<Tag.Address>], _ content: Node...) -> Node {
    return el("address", attribs, ...content)
  }

  /// The `<address>` element represents contact information for a person, people or organization. It should include physical and/or digital location/contact information and a means of identifying a person(s) or organization the information pertains to.
  ///
  /// - Parameter content: Child nodes.
  public static func address(_ content: Node...) -> Node {
    return address([], ...content)
  }

  /// The `<article>` element represents a complete, or self-contained, composition in a document, page, application, or site. This could be a magazine, newspaper, technical or scholarly article, an essay or report, a blog or other social media post.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func article(_ attribs: [Attribute<Tag.Article>], _ content: Node...) -> Node {
    return el("article", attribs, ...content)
  }

  /// The `<article>` element represents a complete, or self-contained, composition in a document, page,
  /// application, or site. This could be a magazine, newspaper, technical or scholarly article, an essay or
  /// report, a blog or other social media post.
  ///
  /// - Parameter content: Child nodes.
  public static func article(_ content: Node...) -> Node {
    return article([], ...content)
  }

  /// The `<aside>` element represents a section of a page that consists of content that is tangentially related to the content of the parenting sectioning content, and which could be considered separate from that content. Such sections are often represented as sidebars in printed typography.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func aside(_ attribs: [Attribute<Tag.Aside>], _ content: Node...) -> Node {
    return el("aside", attribs, ...content)
  }

  /// The `<aside>` element represents a section of a page that consists of content that is tangentially related to the content of the parenting sectioning content, and which could be considered separate from that content. Such sections are often represented as sidebars in printed typography.
  ///
  /// - Parameter content: Child nodes.
  public static func aside(_ content: Node...) -> Node {
    return aside([], ...content)
  }

  /// An `<audio>` element represents a sound or audio stream.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  ///   - transparent: Additional child nodes that render as content for older Web browsers which do not support `<audio>`
  public static func audio(
    _ attribs: [Attribute<Tag.Audio>],
    _ content: [ChildOf<Tag.Audio>],
    _ transparent: Node = [])
    -> Node {

      return el("audio", attribs, .fragment(content.map { $0.rawValue } + [transparent]))
  }

  /// An `<audio>` element represents a sound or audio stream.
  ///
  /// - Parameter content: Child nodes.
  ///   - transparent: Additional child nodes that render as content for older Web browsers which do not support `<audio>`
  public static func audio(_ content: [ChildOf<Tag.Audio>], _ transparent: Node = []) -> Node {
    return audio([], content, transparent)
  }

  /// The `<b>` element represents a span of text to which attention is being drawn for utilitarian purposes without conveying any extra importance and with no implication of an alternate voice or mood, such as key words in a document abstract, product names in a review, actionable words in interactive text-driven software, or an article lede.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func b(_ attribs: [Attribute<Tag.B>], _ content: Node...) -> Node {
    return el("b", attribs, ...content)
  }

  /// The `<b>` element represents a span of text to which attention is being drawn for utilitarian purposes without conveying any extra importance and with no implication of an alternate voice or mood, such as key words in a document abstract, product names in a review, actionable words in interactive text-driven software, or an article lede.
  ///
  /// - Parameter content: Child nodes.
  public static func b(_ content: Node...) -> Node {
    return b([], ...content)
  }

  /// The `<bdi>` element represents a span of text that is to be isolated from its surroundings for the purposes of bidirectional text formatting.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func bdi(_ attribs: [Attribute<Tag.Bdi>], _ content: Node...) -> Node {
    return el("bdi", attribs, ...content)
  }

  /// The `<bdi>` element represents a span of text that is to be isolated from its surroundings for the purposes of bidirectional text formatting.
  ///
  /// - Parameter content: Child nodes.
  public static func bdi(_ content: Node...) -> Node {
    return bdi([], ...content)
  }

  /// The `<bdo>` element represents explicit text directionality formatting control for its children. It allows authors to override the Unicode bidirectional algorithm by explicitly specifying a direction override.
  ///
  /// - Parameters:
  ///   - dir: The element's text directionality.
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func bdo(dir: BdoDirection, _ attribs: [Attribute<Tag.Bdi>], _ content: Node...) -> Node {
    return el("bdo", [.init("dir", dir.rawValue)] + attribs, ...content)
  }

  /// The `<bdo>` element represents explicit text directionality formatting control for its children. It allows authors to override the Unicode bidirectional algorithm by explicitly specifying a direction override.
  ///
  /// - Parameters:
  ///   - dir: The element's text directionality.
  ///   - content: Child nodes.
  public static func bdo(dir: BdoDirection, _ content: Node...) -> Node {
    return bdo(dir: dir, [], ...content)
  }

  /// The `<blockquote>` element represents content that is quoted from another source, optionally with a citation which must be within a `<footer>` or `<cite>` element, and optionally with in-line changes such as annotations and abbreviations.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func blockquote(_ attribs: [Attribute<Tag.Blockquote>], _ content: Node...) -> Node {
    return el("blockquote", attribs, ...content)
  }

  /// The `<blockquote>` element represents content that is quoted from another source, optionally with a citation which must be within a `<footer>` or `<cite>` element, and optionally with in-line changes such as annotations and abbreviations.
  ///
  /// - Parameter content: Child nodes.
  public static func blockquote(_ content: Node...) -> Node {
    return blockquote([], ...content)
  }

  /// The `<br>` element represents a line break.
  public static let br: Node = el("br", [])

  /// The `<button>` element represents a control allowing a user to trigger actions, when enabled. It is labeled by its content.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func button(_ attribs: [Attribute<Tag.Button>], _ content: Node...) -> Node {
    return el("button", attribs, ...content)
  }

  /// The `<button>` element represents a control allowing a user to trigger actions, when enabled. It is labeled by its content.
  ///
  /// - Parameter content: Child nodes.
  public static func button(_ content: Node...) -> Node {
    return button([], ...content)
  }

  /// The `<canvas>` element provides scripts with a resolution-dependent bitmap canvas, which can be used for rendering graphs, game graphics, art, or other visual images on the fly.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func canvas(_ attribs: [Attribute<Tag.Canvas>], _ content: Node...) -> Node {
    return el("canvas", attribs, ...content)
  }

  /// The `<canvas>` element provides scripts with a resolution-dependent bitmap canvas, which can be used for rendering graphs, game graphics, art, or other visual images on the fly.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func canvas(_ content: Node...) -> Node {
    return canvas([], ...content)
  }

  /// The `<cite>` element represents a reference to a creative work. It must include the title of the work or the name of the author (person, people or organization) or an URL reference, or a reference in abbreviated form as per the conventions used for the addition of citation metadata.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func cite(_ attribs: [Attribute<Tag.Cite>], _ content: Node...) -> Node {
    return el("cite", attribs, ...content)
  }

  /// The `<cite>` element represents a reference to a creative work. It must include the title of the work or the name of the author (person, people or organization) or an URL reference, or a reference in abbreviated form as per the conventions used for the addition of citation metadata.
  ///
  /// - Parameter content: Child nodes.
  public static func cite(_ content: Node...) -> Node {
    return cite([], ...content)
  }

  /// The `<code>` element represents a fragment of computer code. This could be an XML element name, a file name, a computer program, or any other string that a computer would recognize.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func code(_ attribs: [Attribute<Tag.Code>], _ content: Node...) -> Node {
    return el("code", attribs, ...content)
  }

  /// The `<code>` element represents a fragment of computer code. This could be an XML element name, a file name, a computer program, or any other string that a computer would recognize.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func code(_ content: Node...) -> Node {
    return code([], ...content)
  }

  /// The `<del>` element represents a removal from the document.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func del(_ attribs: [Attribute<Tag.Del>], _ content: Node...) -> Node {
    return el("del", attribs, ...content)
  }

  /// The `<del>` element represents a removal from the document.
  ///
  /// - Parameter content: Child nodes.
  public static func del(_ content: Node...) -> Node {
    return del([], ...content)
  }

  // TODO: required first child element "summary"
  /// The `<details>` element represents a disclosure widget from which the user can obtain additional information or controls.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func details(_ attribs: [Attribute<Tag.Details>], _ content: Node...) -> Node {
    return el("details", attribs, ...content)
  }

  // TODO: required first child element "summary"
  /// The `<details>` element represents a disclosure widget from which the user can obtain additional information or controls.
  ///
  /// - Parameter content: Child nodes.
  public static func details(_ content: Node...) -> Node {
    return details([], ...content)
  }

  /// The `<dfn>` element represents the defining instance of a term. The term-description group, `<p>`, `<li>` or `<section>` element that is the nearest ancestor of the `<dfn>` element must also contain the definition(s) for the term given by the `<dfn>` element.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func dfn(_ attribs: [Attribute<Tag.Dfn>], _ content: Node...) -> Node {
    return el("dfn", attribs, ...content)
  }

  /// The `<dfn>` element represents the defining instance of a term. The term-description group, `<p>`, `<li>` or `<section>` element that is the nearest ancestor of the `<dfn>` element must also contain the definition(s) for the term given by the `<dfn>` element.
  ///
  /// - Parameter content: Child nodes.
  public static func dfn(_ content: Node...) -> Node {
    return dfn([], ...content)
  }

  /// The `<div>` element has no special meaning at all. It represents its children. It can be used with the `class`, `lang`, and `title` attributes to mark up semantics common to a group of consecutive elements.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func div(_ attribs: [Attribute<Tag.Div>], _ content: Node...) -> Node {
    return el("div", attribs, ...content)
  }

  /// The `<div>` element has no special meaning at all. It represents its children.
  ///
  /// - Parameter content: Child nodes.
  public static func div(_ content: Node...) -> Node {
    return div([], ...content)
  }

  /// The `<dl>` element represents a description list of zero or more term-description groups. Each term-description group consists of one or more terms (represented by `<dt>` elements) possibly as children of a `<div>` element child, and one or more descriptions (represented by `<dd>` elements possibly as children of a `<div>` element child), ignoring any nodes other than `<dt>` and `<dd>` element children, and `<dt>` and `<dd>` elements that are children of `<div>` element children within a single `<dl>` element.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func dl(_ attribs: [Attribute<Tag.Dl>], _ content: ChildOf<Tag.Dl>...) -> Node {
    return el("dl", attribs, (...content).rawValue)
  }

  /// The `<dl>` element represents a description list of zero or more term-description groups. Each term-description group consists of one or more terms (represented by `<dt>` elements) possibly as children of a `<div>` element child, and one or more descriptions (represented by `<dd>` elements possibly as children of a `<div>` element child), ignoring any nodes other than `<dt>` and `<dd>` element children, and `<dt>` and `<dd>` elements that are children of `<div>` element children within a single `<dl>` element.
  ///
  /// - Parameter content: Child nodes.
  public static func dl(_ content: ChildOf<Tag.Dl>...) -> Node {
    return dl([], ...content)
  }

  /// The `<em>` element represents stress emphasis of its contents.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func em(_ attribs: [Attribute<Tag.Em>], _ content: Node...) -> Node {
    return el("em", attribs, ...content)
  }

  /// The `<em>` element represents stress emphasis of its contents.
  ///
  /// - Parameter content: Child nodes.
  public static func em(_ content: Node...) -> Node {
    return em([], ...content)
  }

  /// The `<embed>` element provides an integration point for an external (typically non-HTML) application or interactive content.
  ///
  /// - Parameter attribs: Attributes.
  public static func embed(_ attribs: [Attribute<Tag.Embed>]) -> Node {
    return el("embed", attribs, [])
  }

  /// The `<fieldset>` element represents a set of form controls optionally grouped under a common name.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func fieldset(_ attribs: [Attribute<Tag.Fieldset>], _ content: Node...) -> Node {
    return el("fieldset", attribs, ...content)
  }

  /// The `<fieldset>` element represents a set of form controls optionally grouped under a common name.
  ///
  /// - Parameter content: Child nodes.
  public static func fieldset(_ content: Node...) -> Node {
    return fieldset([], ...content)
  }

  /// The `<figure>` element represents some flow content, optionally with a caption, that is self-contained (like a complete sentence) and is typically referenced as a single unit from the main flow of the document.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func figure(_ attribs: [Attribute<Tag.Figure>], _ content: ChildOf<Tag.Figure>...) -> Node {
    return el("figure", attribs, (...content).rawValue)
  }

  /// The `<figure>` element represents some flow content, optionally with a caption, that is self-contained (like a complete sentence) and is typically referenced as a single unit from the main flow of the document.
  ///
  /// - Parameter content: Child nodes.
  public static func figure(_ content: ChildOf<Tag.Figure>...) -> Node {
    return figure([], ...content)
  }

  /// The `<footer>` element represents a footer for its nearest ancestor `<main>` element or sectioning content or sectioning root element. A footer typically contains information about its section, such as who wrote it, links to related documents, copyright data, and the like.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func footer(_ attribs: [Attribute<Tag.Footer>], _ content: Node...) -> Node {
    return el("footer", attribs, ...content)
  }

  /// The `<footer>` element represents a footer for its nearest ancestor `<main>` element or sectioning content or sectioning root element. A footer typically contains information about its section, such as who wrote it, links to related documents, copyright data, and the like.
  ///
  /// - Parameter content: Child nodes.
  public static func footer(_ content: Node...) -> Node {
    return footer([], ...content)
  }

  /// The `<form>` element represents a collection of form-associated elements, some of which can represent editable values that can be submitted to a server for processing.
  ///
  /// - Parameters:
  ///   - enctype: Enctype to use for form encoding.
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func form(enctype: Enctype, _ attribs: [Attribute<Tag.Form>], _ content: Node...) -> Node {
    return form([.method(.post), .init("enctype", enctype.rawValue)] + attribs, ...content)
  }

  /// The `<form>` element represents a collection of form-associated elements, some of which can represent editable values that can be submitted to a server for processing.
  ///
  /// - Parameters:
  ///   - enctype: Enctype to use for form encoding.
  ///   - content: Child nodes.
  public static func form(enctype: Enctype, _ content: Node...) -> Node {
    return form(enctype: enctype, [], ...content)
  }

  /// The `<form>` element represents a collection of form-associated elements, some of which can represent editable values that can be submitted to a server for processing.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func form(_ attribs: [Attribute<Tag.Form>], _ content: Node...) -> Node {
    return el("form", attribs, ...content)
  }

  /// The `<form>` element represents a collection of form-associated elements, some of which can represent editable values that can be submitted to a server for processing.
  ///
  /// - Parameter content: Child nodes.
  public static func form(_ content: Node...) -> Node {
    return form([], ...content)
  }

  /// These elements represent headings for their sections. The `<h1>` element has the highest rank.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func h1(_ attribs: [Attribute<Tag.H1>], _ content: Node...) -> Node {
    return el("h1", attribs, ...content)
  }

  /// These elements represent headings for their sections. The `<h1>` element has the highest rank.
  ///
  /// - Parameter content: Child nodes.
  public static func h1(_ content: Node...) -> Node {
    return h1([], ...content)
  }

  /// These elements represent headings for their sections. The `<h2>` element has the second-highest rank.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func h2(_ attribs: [Attribute<Tag.H2>], _ content: Node...) -> Node {
    return el("h2", attribs, ...content)
  }

  /// These elements represent headings for their sections. The `<h2>` element has the second-highest rank.
  ///
  /// - Parameter content: Child nodes.
  public static func h2(_ content: Node...) -> Node {
    return h2([], ...content)
  }

  /// These elements represent headings for their sections. The `<h3>` element has the third-highest rank.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func h3(_ attribs: [Attribute<Tag.H3>], _ content: Node...) -> Node {
    return el("h3", attribs, ...content)
  }

  /// These elements represent headings for their sections. The `<h3>` element has the third-highest rank.
  ///
  /// - Parameter content: Child nodes.
  public static func h3(_ content: Node...) -> Node {
    return h3([], ...content)
  }

  /// These elements represent headings for their sections. The `<h4>` element has the fourth-highest rank.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func h4(_ attribs: [Attribute<Tag.H4>], _ content: Node...) -> Node {
    return el("h4", attribs, ...content)
  }

  /// These elements represent headings for their sections. The `<h4>` element has the fourth-highest rank.
  ///
  /// - Parameter content: Child nodes.
  public static func h4(_ content: Node...) -> Node {
    return h4([], ...content)
  }

  /// These elements represent headings for their sections. The `<h5>` element has the fifth-highest rank.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func h5(_ attribs: [Attribute<Tag.H5>], _ content: Node...) -> Node {
    return el("h5", attribs, ...content)
  }

  /// These elements represent headings for their sections. The `<h5>` element has the fifth-highest rank.
  ///
  /// - Parameter content: Child nodes.
  public static func h5(_ content: Node...) -> Node {
    return h5([], ...content)
  }

  /// These elements represent headings for their sections. The `<h6>` element has the lowest rank.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func h6(_ attribs: [Attribute<Tag.H6>], _ content: Node...) -> Node {
    return el("h6", attribs, ...content)
  }

  /// These elements represent headings for their sections. The `<h6>` element has the lowest rank.
  ///
  /// - Parameter content: Child nodes.
  public static func h6(_ content: Node...) -> Node {
    return h6([], ...content)
  }

  /// The `<head> element represents a collection of metadata for the `Document`.
  ///
  /// - Parameter content: Child nodes.
  ///
  /// - Parameters:
  ///   - title: Content for the `<title>` element.
  ///   - content: Child nodes.
  //public static func head(title: String, content: ChildOf<Tag.Head> = []) -> ChildOf<Tag.Html> {
  //  return head([Html.title(title).rawValue, content.rawValue])
  //}

  /// The `<header>` element represents introductory content for its nearest ancestor `<main>` element or sectioning content or sectioning root element. A `<header>` typically contains a group of introductory or navigational aids.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func header(_ attribs: [Attribute<Tag.Header>], _ content: Node...) -> Node {
    return el("header", attribs, ...content)
  }

  /// The `<header>` element represents introductory content for its nearest ancestor `<main>` element or sectioning content or sectioning root element. A `<header>` typically contains a group of introductory or navigational aids.
  ///
  /// - Parameter content: Child nodes.
  public static func header(_ content: Node...) -> Node {
    return header([], ...content)
  }

  /// The `<hr>` element represents a paragraph-level thematic break, e.g., a scene change in a story, or a transition to another topic within a section of a reference book.
  public static let hr: Node = el("hr", [])

  /// The `<hr>` element represents a paragraph-level thematic break, e.g., a scene change in a story, or a transition to another topic within a section of a reference book.
  ///
  /// - Parameter attribs: Attributes.
  public static func hr(_ attribs: [Attribute<Tag.Hr>]) -> Node {
    return el("hr", attribs, [])
  }

  /// The `<html>` element represents the root of an HTML document.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func html(_ attribs: [Attribute<Tag.Html>], _ content: ChildOf<Tag.Html>...) -> Node {
    return el("html", attribs, (...content).rawValue)
  }

  /// The `<html>` element represents the root of an HTML document.
  ///
  /// - Parameter content: Child nodes.
  public static func html(_ content: ChildOf<Tag.Html>...) -> Node {
    return html([], ...content)
  }

  /// The `<i>` element represents a span of text in an alternate voice or mood, or otherwise offset from the normal prose in a manner indicating a different quality of text, such as a taxonomic designation, a technical term, an idiomatic phrase from another language, transliteration, a thought, or a ship name in Western texts.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func i(_ attribs: [Attribute<Tag.I>], _ content: Node...) -> Node {
    return el("i", attribs, ...content)
  }

  /// The `<i>` element represents a span of text in an alternate voice or mood, or otherwise offset from the normal prose in a manner indicating a different quality of text, such as a taxonomic designation, a technical term, an idiomatic phrase from another language, transliteration, a thought, or a ship name in Western texts.
  ///
  /// - Parameter content: Child nodes.
  public static func i(_ content: Node...) -> Node {
    return i([], ...content)
  }

  /// The `<iframe>` element represents a nested browsing context.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func iframe(_ attribs: [Attribute<Tag.Iframe>], _ content: Node...) -> Node {
    return el("iframe", attribs, ...content)
  }

  /// An `<img>` element represents an image and its fallback content.
  ///
  /// - Parameter attribs: An array of attributes.
  public static func img(_ attribs: [Attribute<Tag.Img>]) -> Node {
    return el("img", attribs, [])
  }

  /// An `<img>` element represents an image and its fallback content.
  ///
  /// - Parameters:
  ///   - src: Address of the resource.
  ///   - alt: Replacement text for use when images are not available.
  ///   - attribs: Additional attributes.
  public static func img(src: String, alt: String, _ attribs: [Attribute<Tag.Img>] = []) -> Node {
    return img([.src(src), .alt(alt)] + attribs)
  }

  /// An `<img>` element represents an image and its fallback content.
  ///
  /// - Parameters:
  ///   - base64: A base64-encoded image.
  ///   - type: The image's content encoding.
  ///   - alt: Replacement text for use when images are not available.
  ///   - attribs: Additional attributes.
  public static func img(base64: String, type: MediaType, alt: String, _ attribs: [Attribute<Tag.Img>])
    -> Node {

      return img(src: "data:\(type.description);base64,\(base64)", alt: alt, attribs)
  }

  /// The `<input>` element represents a typed data field, usually with a form control to allow the user to edit the data.
  ///
  /// - Parameter attribs: Attributes.
  public static func input(_ attribs: [Attribute<Tag.Input>]) -> Node {
    return el("input", attribs, [])
  }

  /// The `<ins>` element represents an addition to the document.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func ins(_ attribs: [Attribute<Tag.Ins>], _ content: Node...) -> Node {
    return el("ins", attribs, ...content)
  }

  /// The `<ins>` element represents an addition to the document.
  ///
  /// - Parameter content: Child nodes.
  public static func ins(_ content: Node...) -> Node {
    return ins([], ...content)
  }

  /// The `<kbd>` element represents user input (typically keyboard input, although it may also be used to represent other input, such as voice commands).
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func kbd(_ attribs: [Attribute<Tag.Kbd>], _ content: Node...) -> Node {
    return el("kbd", attribs, ...content)
  }

  /// The `<kbd>` element represents user input (typically keyboard input, although it may also be used to represent other input, such as voice commands).
  ///
  /// - Parameter content: Child nodes.
  public static func kbd(_ content: Node...) -> Node {
    return kbd([], ...content)
  }

  /// The `<label>` element represents a caption in a user interface. The caption can be associated with a specific form control, known as the `<label>` element's **labeled control**, either using the `for` attribute, or by putting the form control inside the `<label>` element itself.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func label(_ attribs: [Attribute<Tag.Label>], _ content: Node...) -> Node {
    return el("label", attribs, ...content)
  }

  /// The `<label>` element represents a caption in a user interface. The caption can be associated with a specific form control, known as the `<label>` element's **labeled control**, either using the `for` attribute, or by putting the form control inside the `<label>` element itself.
  ///
  /// - Parameter content: Child nodes.
  public static func label(_ content: Node...) -> Node {
    return label([], ...content)
  }

  /// The `<legend>` element represents a caption for the rest of the contents of the `<legend>` element's parent `<fieldset>` element, if any.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func legend(_ attribs: [Attribute<Tag.Legend>], _ content: Node...) -> ChildOf<Tag.Fieldset> {
    return .init(el("legend", attribs, ...content))
  }

  /// The `<main>` element represents the main content of the `<body>` of a document or application.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func main(_ attribs: [Attribute<Tag.Main>], _ content: Node...) -> Node {
    return el("main", attribs, ...content)
  }

  /// The `<main>` element represents the main content of the `<body>` of a document or application.
  ///
  /// - Parameter content: Child nodes.
  public static func main(_ content: Node...) -> Node {
    return main([], ...content)
  }

  /// The `<map>` element, in conjunction with an `<img>` element and any `<area>` element descendants, defines an image map. The element represents its children.
  ///
  /// - Parameters:
  ///   - name: The `name` attribute gives the map a name so that it can be referenced. The attribute must be present and must have a non-empty value with no space characters. The value of the `name` attribute must not be a compatibility caseless match for the value of the `name` attribute of another `<map>` element in the same document. If the `id` attribute is also specified, both attributes must have the same value.
  ///   - attribs: Additional attributes.
  ///   - content: Child nodes.
  public static func map(name: String, _ attribs: [Attribute<Tag.Map>], _ content: ChildOf<Tag.Map>...)
    -> Node {

      return el("map", [.name(name)] + attribs, (...content).rawValue)
  }

  /// The `<map>` element, in conjunction with an `<img>` element and any `<area>` element descendants, defines an image map. The element represents its children.
  ///
  /// - Parameters:
  ///   - name: The `name` attribute gives the map a name so that it can be referenced. The attribute must be present and must have a non-empty value with no space characters. The value of the `name` attribute must not be a compatibility caseless match for the value of the `name` attribute of another `<map>` element in the same document. If the `id` attribute is also specified, both attributes must have the same value.
  ///   - content: Child nodes.
  public static func map(name: String, _ content: ChildOf<Tag.Map>...) -> Node {
    return map(name: name, [], ...content)
  }

  /// The `<mark>` element represents a run of text in one document marked or highlighted for reference purposes, due to its relevance in another context. When used in a quotation or other block of text referred to from the prose, it indicates a highlight that was not originally present but which has been added to bring the reader's attention to a part of the text that might not have been considered important by the original author when the block was originally written, but which is now under previously unexpected scrutiny. When used in the main prose of a document, it indicates a part of the document that has been highlighted due to its likely relevance to the user's current activity.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func mark(_ attribs: [Attribute<Tag.Mark>], _ content: Node...) -> Node {
    return el("mark", attribs, ...content)
  }

  /// The `<mark>` element represents a run of text in one document marked or highlighted for reference purposes, due to its relevance in another context. When used in a quotation or other block of text referred to from the prose, it indicates a highlight that was not originally present but which has been added to bring the reader's attention to a part of the text that might not have been considered important by the original author when the block was originally written, but which is now under previously unexpected scrutiny. When used in the main prose of a document, it indicates a part of the document that has been highlighted due to its likely relevance to the user's current activity.
  ///
  /// - Parameter content: Child nodes.
  public static func mark(_ content: Node...) -> Node {
    return mark([], ...content)
  }

  /// The `<meter>` element represents a scalar measurement within a known range, or a fractional value; for example disk usage, the relevance of a query result, or the fraction of a voting population to have selected a particular candidate.
  ///
  /// - Parameters:
  ///   - value: The `value` attribute specifies the value to have the gauge indicate as the "measured" value.
  ///   - attribs: Additional attributes.
  ///   - content: Child nodes.
  public static func meter(value: Double, _ attribs: [Attribute<Tag.Meter>], _ content: Node...) -> Node {
    return el("meter", [.value(value)] + attribs, ...content)
  }

  /// The `<meter>` element represents a scalar measurement within a known range, or a fractional value; for example disk usage, the relevance of a query result, or the fraction of a voting population to have selected a particular candidate.
  ///
  /// - Parameters:
  ///   - value: The `value` attribute specifies the value to have the gauge indicate as the "measured" value.
  ///   - content: Child nodes.
  public static func meter(value: Double, _ content: Node...) -> Node {
    return meter(value: value, [], ...content)
  }

  /// The `<nav>` element represents a section of a page that links to other pages or to parts within the page: a section with navigation links.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func nav(_ attribs: [Attribute<Tag.Nav>], _ content: Node...) -> Node {
    return el("nav", attribs, ...content)
  }

  /// The `<nav>` element represents a section of a page that links to other pages or to parts within the page: a section with navigation links.
  ///
  /// - Parameter content: Child nodes.
  public static func nav(_ content: Node...) -> Node {
    return nav([], ...content)
  }

  // TODO: Required attribute "data" or "type"
  /// The `<object>` element can represent an external resource, which, depending on the type of the resource, will either be treated as an image, as a nested browsing context, or as an external resource to be processed by a plugin.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func object(_ attribs: [Attribute<Tag.Object>], _ content: ChildOf<Tag.Object>...) -> Node {
    return el("object", attribs, (...content).rawValue)
  }

  /// The `<ol>` element represents a list of items, where the items have been intentionally ordered, such that changing the order would change the meaning of the document.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func ol(_ attribs: [Attribute<Tag.Ol>], _ content: ChildOf<Tag.Ol>...) -> Node {
    return el("ol", attribs, (...content).rawValue)
  }

  /// The `<ol>` element represents a list of items, where the items have been intentionally ordered, such that changing the order would change the meaning of the document.
  ///
  /// - Parameter content: Child nodes.
  public static func ol(_ content: ChildOf<Tag.Ol>...) -> Node {
    return ol([], ...content)
  }

  /// The `<optgroup>` element represents a group of `<option>` elements with a common label.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func optgroup(_ attribs: [Attribute<Tag.Optgroup>], _ content: ChildOf<Tag.Optgroup>...)
    -> Node {
      return el("optgroup", attribs, (...content).rawValue)
  }

  /// The `<optgroup>` element represents a group of `<option>` elements with a common label.
  ///
  /// - Parameter content: Child nodes.
  public static func optgroup(_ content: ChildOf<Tag.Optgroup>...) -> Node {
    return optgroup([], ...content)
  }

  /// The `<output>` element represents the result of a calculation performed by the application, or the result
  /// of a user action.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func output(_ attribs: [Attribute<Tag.Output>], _ content: Node...) -> Node {
    return el("output", attribs, ...content)
  }

  /// The `<output>` element represents the result of a calculation performed by the application, or the result
  /// of a user action.
  ///
  /// - Parameter content: Child nodes.
  public static func output(_ content: Node...) -> Node {
    return output([], ...content)
  }

  /// The `<p>` element represents a paragraph.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func p(_ attribs: [Attribute<Tag.P>], _ content: Node...) -> Node {
    return el("p", attribs, ...content)
  }

  /// The `<p>` element represents a paragraph.
  ///
  /// - Parameter content: Child nodes.
  public static func p(_ content: Node...) -> Node {
    return p([], ...content)
  }

  /// The `<pre>` element represents a block of preformatted text, in which structure is represented by typographic conventions rather than by elements.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func pre(_ attribs: [Attribute<Tag.Pre>], _ content: Node...) -> Node {
    return el("pre", attribs, ...content)
  }

  /// The `<pre>` element represents a block of preformatted text, in which structure is represented by typographic conventions rather than by elements.
  ///
  /// - Parameter content: Child nodes.
  public static func pre(_ content: Node...) -> Node {
    return pre([], ...content)
  }

  /// The `<q>` element represents some phrasing content quoted from another source.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func q(_ attribs: [Attribute<Tag.Q>], _ content: Node...) -> Node {
    return el("q", attribs, ...content)
  }

  /// The `<q>` element represents some phrasing content quoted from another source.
  ///
  /// - Parameter content: Child nodes.
  public static func q(_ content: Node...) -> Node {
    return q([], ...content)
  }

  /// The `<s>` element represents contents that are no longer accurate or no longer relevant.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func s(_ attribs: [Attribute<Tag.S>], _ content: Node...) -> Node {
    return el("s", attribs, ...content)
  }

  /// The `<s>` element represents contents that are no longer accurate or no longer relevant.
  ///
  /// - Parameter content: Child nodes.
  public static func s(_ content: Node...) -> Node {
    return s([], ...content)
  }

  /// The `samp` element represents sample or quoted output from another program or computing system.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func samp(_ attribs: [Attribute<Tag.Samp>], _ content: Node...) -> Node {
    return el("samp", attribs, ...content)
  }

  /// The `samp` element represents sample or quoted output from another program or computing system.
  ///
  /// - Parameter content: Child nodes.
  public static func samp(_ content: Node...) -> Node {
    return samp([], ...content)
  }

  /// The `<script>` element allows authors to include dynamic script and data blocks in their documents. The element does not represent content for the user.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: JavaScript.
  public static func script(_ attribs: [Attribute<Tag.Script>], _ content: StaticString) -> Node {
    return el("script", attribs, [.raw(escape(rawText: String(describing: content), for: "script"))])
  }

  /// The `<script>` element allows authors to include dynamic script and data blocks in their documents. The element does not represent content for the user.
  ///
  /// - Parameter attribs: Attributes.
  public static func script(_ attribs: [Attribute<Tag.Script>]) -> Node {
    return el("script", attribs, [])
  }

  /// The `<script>` element allows authors to include dynamic script and data blocks in their documents. The element does not represent content for the user.
  ///
  /// - Parameter content: JavaScript.
  public static func script(_ content: StaticString) -> Node {
    return script([], content)
  }

  /// The `<section>` element represents a generic section of a document or application. A section, in this context, is a thematic grouping of content. Each `<section>` should be identified, typically by including a heading (`<h1>`-`<h6>` element) as a child of the section element.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func section(_ attribs: [Attribute<Tag.Section>], _ content: Node...) -> Node {
    return el("section", attribs, ...content)
  }

  /// The `<section>` element represents a generic section of a document or application. A section, in this context, is a thematic grouping of content. Each `<section>` should be identified, typically by including a heading (`<h1>`-`<h6>` element) as a child of the section element.
  ///
  /// - Parameter content: Child nodes.
  public static func section(_ content: Node...) -> Node {
    return section([], ...content)
  }

  /// The `<select>` element represents a control for selecting amongst a set of options.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func select(_ attribs: [Attribute<Tag.Select>], _ content: ChildOf<Tag.Select>...) -> Node {
    return el("select", attribs, (...content).rawValue)
  }

  /// The `<select>` element represents a control for selecting amongst a set of options.
  ///
  /// - Parameter content: Child nodes.
  public static func select(_ content: ChildOf<Tag.Select>...) -> Node {
    return select([], ...content)
  }

  /// The `<small>` element represents side comments such as small print.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func small(_ attribs: [Attribute<Tag.Small>], _ content: Node...) -> Node {
    return el("small", attribs, ...content)
  }

  /// The `<small>` element represents side comments such as small print.
  ///
  /// - Parameter content: Child nodes.
  public static func small(_ content: Node...) -> Node {
    return small([], ...content)
  }

  /// The `<span>` element doesn't mean anything on its own, but can be useful when used together with the global attributes, e.g., `class`, `lang`, or `dir`. It represents its children.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func span(_ attribs: [Attribute<Tag.Span>], _ content: Node...) -> Node {
    return el("span", attribs, ...content)
  }

  /// The `<span>` element doesn't mean anything on its own, but can be useful when used together with the global attributes, e.g., `class`, `lang`, or `dir`. It represents its children.
  ///
  /// - Parameter content: Child nodes.
  public static func span(_ content: Node...) -> Node {
    return span([], ...content)
  }

  /// The `<strong>` element represents strong importance, seriousness, or urgency for its contents.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func strong(_ attribs: [Attribute<Tag.Strong>], _ content: Node...) -> Node {
    return el("strong", attribs, ...content)
  }

  /// The `<strong>` element represents strong importance, seriousness, or urgency for its contents.
  ///
  /// - Parameter content: Child nodes.
  public static func strong(_ content: Node...) -> Node {
    return strong([], ...content)
  }

  /// The `<sub>` element represents a subscript.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func sub(_ attribs: [Attribute<Tag.Sub>], _ content: Node...) -> Node {
    return el("sub", attribs, ...content)
  }

  /// The `<sub>` element represents a subscript.
  ///
  /// - Parameter content: Child nodes.
  public static func sub(_ content: Node...) -> Node {
    return sub([], ...content)
  }

  /// The `<sup>` element represents a superscript.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func sup(_ attribs: [Attribute<Tag.Sup>], _ content: Node...) -> Node {
    return el("sup", attribs, ...content)
  }

  /// The `<sup>` element represents a superscript.
  ///
  /// - Parameter content: Child nodes.
  public static func sup(_ content: Node...) -> Node {
    return sup([], ...content)
  }

  public static func svg(_ attribs: [Attribute<Tag.Svg>], _ content: StaticString) -> Node {
    return el("svg", attribs, [.raw(String(describing: content))])
  }

  public static func svg(_ content: StaticString) -> Node {
    return svg([], content)
  }

  /// The `<table>` element represents data with more than one dimension, in the form of a table.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func table(_ attribs: [Attribute<Tag.Table>], _ content: ChildOf<Tag.Table>...) -> Node {
    return el("table", attribs, (...content).rawValue)
  }

  /// The `<table>` element represents data with more than one dimension, in the form of a table.
  ///
  /// - Parameter content: Child nodes.
  public static func table(_ content: ChildOf<Tag.Table>...) -> Node {
    return table([], ...content)
  }

  /// The `<textarea>` element represents a multiline plain text edit control for the element's raw value. The contents of the control represent the control's default value.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Text content.
  public static func textarea(_ attribs: [Attribute<Tag.Textarea>], _ content: String = "") -> Node {
    return el("textarea", attribs, [.raw(escape(rawText: content, for: "textarea"))])
  }

  /// The `<textarea>` element represents a multiline plain text edit control for the element's raw value. The contents of the control represent the control's default value.
  ///
  /// - Parameter content: Text content.
  public static func textarea(_ content: String = "") -> Node {
    return textarea([], content)
  }

  /// The `<time>` element represents its contents, along with a machine-readable form of those contents in the datetime attribute. The kind of content is limited to various kinds of dates, times, time-zone offsets, and durations, as described below.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func time(_ attribs: [Attribute<Tag.Time>], _ content: Node...) -> Node {
    return el("time", attribs, ...content)
  }

  /// The `<time>` element represents its contents, along with a machine-readable form of those contents in the datetime attribute. The kind of content is limited to various kinds of dates, times, time-zone offsets, and durations, as described below.
  ///
  /// - Parameter content: Child nodes.
  public static func time(_ content: Node...) -> Node {
    return time([], ...content)
  }

  /// The `<u> element represents a span of text with an unarticulated, though explicitly rendered, non-textual
  /// annotation, such as labeling the text as being a proper name in Chinese text (a Chinese proper name mark),
  /// or labeling the text as being misspelt.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func u(_ attribs: [Attribute<Tag.U>], _ content: Node...) -> Node {
    return el("u", attribs, ...content)
  }

  /// The `<u> element represents a span of text with an unarticulated, though explicitly rendered, non-textual
  /// annotation, such as labeling the text as being a proper name in Chinese text (a Chinese proper name mark),
  /// or labeling the text as being misspelt.
  ///
  /// - Parameter content: Child nodes.
  public static func u(_ content: Node...) -> Node {
    return u([], ...content)
  }

  /// The `<ul>` element represents a list of items, where the order of the items is not important — that is, where changing the order would not materially change the meaning of the document.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func ul(_ attribs: [Attribute<Tag.Ul>], _ content: ChildOf<Tag.Ul>...) -> Node {
    return el("ul", attribs, (...content).rawValue)
  }

  /// The `<ul>` element represents a list of items, where the order of the items is not important — that is, where changing the order would not materially change the meaning of the document.
  ///
  /// - Parameter content: Child nodes.
  public static func ul(_ content: ChildOf<Tag.Ul>...) -> Node {
    return ul([], ...content)
  }

  /// The `<var>` element represents a variable. This could be an actual variable in a mathematical expression or programming context, an identifier representing a constant, a symbol identifying a physical quantity, a function parameter, or just be a term used as a placeholder in prose.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func `var`(_ attribs: [Attribute<Tag.Var>], _ content: Node...) -> Node {
    return el("var", attribs, ...content)
  }

  /// The `<var>` element represents a variable. This could be an actual variable in a mathematical expression or programming context, an identifier representing a constant, a symbol identifying a physical quantity, a function parameter, or just be a term used as a placeholder in prose.
  ///
  /// - Parameter content: Child nodes.
  public static func `var`(_ content: Node...) -> Node {
    return `var`([], ...content)
  }

  /// A `<video>` element is used for playing videos or movies, and audio files with captions.
  ///
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  ///   - transparent: Additional child nodes that render as content for older Web browsers which do not support `<video>`
  public static func video(
    _ attribs: [Attribute<Tag.Video>],
    _ content: ChildOf<Tag.Video>...,
    transparent: Node = []
    )
    -> Node {

      return el("video", attribs, [(...content).rawValue, transparent])
  }

  /// A `<video>` element is used for playing videos or movies, and audio files with captions.
  ///
  ///   - content: Child nodes.
  ///   - transparent: Additional child nodes that render as content for older Web browsers which do not support `<video>`
  public static func video(_ content: ChildOf<Tag.Video>..., transparent: Node = []) -> Node {
    return video([], ...content, transparent: transparent)
  }

  /// The `<wbr>` element represents a line break opportunity.
  public static let wbr: Node = el("wbr", [])
}

extension ChildOf {
  /// The `<script>` element allows authors to include dynamic script and data blocks in their documents. The element does not represent content for the user.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: JavaScript.
  public static func script<T>(_ attribs: [Attribute<Tag.Script>], _ content: StaticString) -> ChildOf<T> {
    return .init(.script(attribs, content))
  }

  /// The `<script>` element allows authors to include dynamic script and data blocks in their documents. The element does not represent content for the user.
  ///
  /// - Parameter attribs: Attributes.
  public static func script<T>(_ attribs: [Attribute<Tag.Script>]) -> ChildOf<T> {
    return .init(.script(attribs))
  }

  /// The `<script>` element allows authors to include dynamic script and data blocks in their documents. The element does not represent content for the user.
  ///
  /// - Parameter content: JavaScript.
  public static func script<T>(_ content: StaticString) -> ChildOf<T> {
    return script([], content)
  }
}

extension ChildOf where T == Tag.Colgroup {
  /// If a `<col>` element has a parent and that is a `<colgroup>` element that itself has a parent that is a `<table>` element, then the `<col>` element represents one or more columns in the column group represented by that `<colgroup>`.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  public static func col(_ attribs: [Attribute<Tag.Col>]) -> ChildOf {
    return .init(el("col", attribs, []))
  }
}

extension ChildOf where T == Tag.Fieldset {
  /// The `<legend>` element represents a caption for the rest of the contents of the `<legend>` element's parent `<fieldset>` element, if any.
  ///
  /// - Parameter content: Child nodes.
  public static func legend(_ content: Node...) -> ChildOf {
    return legend([], ...content)
  }
}

extension ChildOf where T == Tag.Figure {
  /// The `<figcaption>` element represents a caption or legend for the rest of the contents of the `<figcaption>` element's parent `<figure>` element, if any.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func figcaption(_ attribs: [Attribute<Tag.Figcaption>], _ content: Node...)
    -> ChildOf<Tag.Figure> {

      return .init(el("figcaption", attribs, ...content))
  }

  /// The `<figcaption>` element represents a caption or legend for the rest of the contents of the `<figcaption>` element's parent `<figure>` element, if any.
  ///
  /// - Parameter content: Child nodes.
  public static func figcaption(_ content: Node...) -> ChildOf<Tag.Figure> {
    return figcaption([], ...content)
  }
}

extension ChildOf where T == Tag.Head {
  /// The `<base>` element allows authors to specify the document base URL for the purposes of parsing URLs, and the name of the default browsing context for the purposes of following hyperlinks. The element does not represent any content beyond this information.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  public static func base(_ attribs: [Attribute<Tag.Base>]) -> ChildOf {
    return .init(el("base", attribs, []))
  }

  /// The `<link>` element allows authors to link their document to other resources.
  ///
  /// - Parameter attribs: Attributes.
  public static func link(_ attribs: [Attribute<Tag.Link>]) -> ChildOf {
    return .init(el("link", attribs, []))
  }

  public static func meta(_ attribs: [Attribute<Tag.Meta>]) -> ChildOf {
    return .init(el("meta", attribs, []))
  }

  public static func meta(contentType: MediaType) -> ChildOf {
    return meta([.init("http-equiv", "content-type"), .content(contentType.description)])
  }

  public static func meta(defaultStyle: String) -> ChildOf {
    return meta([.init("http-equiv", "default-stype"), .content(defaultStyle)])
  }

  public static func meta(refresh: Int) -> ChildOf {
    return meta([.init("http-equiv", "refresh"), .content(String(refresh))])
  }

  public static func meta(applicationName: String) -> ChildOf {
    return meta([.init("name", "application-name"), .content(applicationName)])
  }

  public static func meta(author: String) -> ChildOf {
    return meta([.init("name", "author"), .content(author)])
  }

  public static func meta(description: String) -> ChildOf {
    return meta([.init("name", "description"), .content(description)])
  }

  public static func meta(generator: String) -> ChildOf {
    return meta([.init("name", "generator"), .content(generator)])
  }

  public static func meta(keywords: [String]) -> ChildOf {
    let sanitizedKeywords = keywords.map { $0.replacingOccurrences(of: ",", with: "&#44;") }
    return meta([.init("name", "keywords"), .content(sanitizedKeywords.joined(separator: ","))])
  }

  public static func meta(name: String, content: String) -> ChildOf {
    return meta([.init("name", name), .content(content)])
  }

  public static func meta(property: String, content: String) -> ChildOf {
    return meta([.init("property", property), .content(content)])
  }

  public static func meta(viewport prop: Viewport, _ props: Viewport...) -> ChildOf {
    return meta([.init("name", "viewport"), .content(([prop] + props).map { $0.description }.joined(separator: ","))])
  }

  /// The `<style>` element allows authors to embed style information in their documents.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: A CSS string.
  public static func style(_ attribs: [Attribute<Tag.Style>], _ content: StaticString) -> ChildOf {
    return style(unsafe: attribs, String(describing: content))
  }

  /// The `<style>` element allows authors to embed style information in their documents.
  ///
  /// - Parameter content: A CSS string.
  public static func style(_ content: StaticString) -> ChildOf {
    return style([], content)
  }

  /// The `<style>` element allows authors to embed style information in their documents.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: A CSS string.
  public static func style(unsafe attribs: [Attribute<Tag.Style>], _ content: String) -> ChildOf {
    return .init(el("style", attribs, [.raw(escape(rawText: content, for: "style"))]))
  }

  /// The `<style>` element allows authors to embed style information in their documents.
  ///
  /// - Parameter content: A CSS string.
  public static func style(unsafe content: String) -> ChildOf {
    return style(unsafe: [], content)
  }

  /// The `<title>` element represents the document's title or name. Authors should use titles that identify their documents even when they are used out of context, for example in a user's history or bookmarks, or in search results. The document's title is often different from its first heading, since the first heading does not have to stand alone when taken out of context.
  ///
  /// - Parameter title: The document's title or name.
  public static func title(_ title: String) -> ChildOf<Tag.Head> {
    return .init(el("title", [.raw(escape(rawText: title, for: "title"))]))
  }
}

extension ChildOf where T == Tag.Html {
  /// The `<body>` element represents the content of the document.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func body(_ attribs: [Attribute<Tag.Body>], _ content: Node...) -> ChildOf {
    return .init(el("body", attribs, ...content))
  }

  /// The `<body>` element represents the content of the document.
  ///
  /// - Parameter content: Child nodes.
  public static func body(_ content: Node...) -> ChildOf {
    return body([], ...content)
  }

  /// The `<head> element represents a collection of metadata for the `Document`.
  ///
  /// - Parameter content: Child nodes.
  public static func head(_ content: ChildOf<Tag.Head>...) -> ChildOf {
    return .init(el("head", (...content).rawValue))
  }
}

extension ChildOf where T == Tag.Map {
  /// The `<area>` element represents either a hyperlink with some text and a corresponding area on an image
  /// map, or a dead area on an image map.
  public static func area(_ attribs: [Attribute<Tag.Area>]) -> ChildOf {
    return .init(el("area", attribs, []))
  }
}

extension ChildOf where T == Tag.Table {
  // TODO: "caption" can only be the first element of a "table"
  /// The `<caption>` element represents the title of the table that is its parent, if it has a parent and that is a table element.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func caption(_ attribs: [Attribute<Tag.Caption>], _ content: Node...) -> ChildOf {
    return .init(el("caption", attribs, ...content))
  }

  // TODO: "caption" can only be the first element of a "table"
  /// The `<caption>` element represents the title of the table that is its parent, if it has a parent and that is a table element.
  ///
  /// - Parameter content: Child nodes.
  public static func caption(_ content: Node...) -> ChildOf {
    return caption([], ...content)
  }

  /// The `<colgroup>` element represents a group of one or more columns in the `table` that is its parent, if it has a parent and that is a `<table>` element.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func colgroup(_ attribs: [Attribute<Tag.Colgroup>], _ content: ChildOf<Tag.Colgroup>...)
    -> ChildOf {

      return .init(el("colgroup", attribs, (...content).rawValue))
  }

  /// The `<colgroup>` element represents a group of one or more columns in the `table` that is its parent, if it has a parent and that is a `<table>` element.
  ///
  /// - Parameter content: Child nodes.
  public static func colgroup(_ content: ChildOf<Tag.Colgroup>...) -> ChildOf {
    return colgroup([], ...content)
  }

  /// The `<tbody>` element represents a block of rows that consist of a body of data for the parent `<table>` element, if the `<tbody>` element has a parent and it is a `<table>`.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func tbody(_ attribs: [Attribute<Tag.Tbody>], _ content: ChildOf<Tag.Tbody>...) -> ChildOf {
    return .init(el("tbody", attribs, (...content).rawValue))
  }

  /// The `<tbody>` element represents a block of rows that consist of a body of data for the parent `<table>` element, if the `<tbody>` element has a parent and it is a `<table>`.
  ///
  /// - Parameter content: Child nodes.
  public static func tbody(_ content: ChildOf<Tag.Tbody>...) -> ChildOf {
    return tbody([], ...content)
  }

  /// The `<tfoot>` element represents the block of rows that consist of the column summaries (footers) for the parent `<table>` element, if the `<tfoot>` element has a parent and it is a `<table>`.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func tfoot(_ attribs: [Attribute<Tag.Tfoot>], _ content: Node...) -> ChildOf {
    return .init(el("tfoot", attribs, ...content))
  }

  /// The `<tfoot>` element represents the block of rows that consist of the column summaries (footers) for the parent `<table>` element, if the `<tfoot>` element has a parent and it is a `<table>`.
  ///
  /// - Parameter content: Child nodes.
  public static func tfoot(_ content: Node...) -> ChildOf {
    return tfoot([], ...content)
  }

  /// The `<thead>` element represents the block of rows that consist of the column labels (headers) for the parent `<table>` element, if the `<thead>` element has a parent and it is a `<table>`.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func thead(_ attribs: [Attribute<Tag.Thead>], _ content: ChildOf<Tag.Thead>...) -> ChildOf {
    return .init(el("thead", attribs, (...content).rawValue))
  }

  /// The `<thead>` element represents the block of rows that consist of the column labels (headers) for the parent `<table>` element, if the `<thead>` element has a parent and it is a `<table>`.
  ///
  /// - Parameter content: Child nodes.
  public static func thead(_ content: ChildOf<Tag.Thead>...) -> ChildOf {
    return thead([], ...content)
  }
}

extension ChildOf where T == Tag.Dl {
  /// The `<dd>` element represents a description, part of a term-description group in a description list (`<dl>` element).
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func dd(_ attribs: [Attribute<Tag.Dd>], _ content: Node...) -> ChildOf {
    return .init(el("dd", attribs, ...content))
  }

  /// The `<dd>` element represents a description, part of a term-description group in a description list (`<dl>` element).
  ///
  /// - Parameter content: Child nodes.
  public static func dd(_ content: Node...) -> ChildOf {
    return dd([], ...content)
  }

  /// The `<dt>` element represents a term, part of a term-description group in a description list (`<dl>` element).
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func dt(_ attribs: [Attribute<Tag.Dt>], _ content: Node...) -> ChildOf {
    return .init(el("dt", attribs, ...content))
  }

  /// The `<dt>` element represents a term, part of a term-description group in a description list (`<dl>` element).
  ///
  /// - Parameter content: Child nodes.
  public static func dt(_ content: Node...) -> ChildOf {
    return dt([], ...content)
  }
}

/// Conforming elements can contain `<li>` elements. Includes `<ol>` and `<ul>` elements.
public protocol ContainsLi {}

extension Tag.Ol: ContainsLi {}
extension Tag.Ul: ContainsLi {}

extension ChildOf where T: ContainsLi {
  /// The `<li>` element represents a list item. If its parent element is an `<ol>`, or `<ul>`, then the element is an item of the parent element's list, as defined for those elements. Otherwise, the list item has no defined list-related relationship to any other `<li>` element.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func li(_ attribs: [Attribute<Tag.Li>], _ content: Node...) -> ChildOf {
    return .init(el("li", attribs, ...content))
  }

  /// The `<li>` element represents a list item. If its parent element is an `<ol>`, or `<ul>`, then the element is an item of the parent element's list, as defined for those elements. Otherwise, the list item has no defined list-related relationship to any other `<li>` element.
  ///
  /// - Parameter content: Child nodes.
  public static func li(_ content: Node...) -> ChildOf {
    return li([], ...content)
  }
}

/// Conforming elements can contain `<option>` elements. Includes `<optgroup>` and `<select>` elements.
public protocol ContainsOption {}

extension Tag.Optgroup: ContainsOption {}
extension Tag.Select: ContainsOption {}

extension ChildOf where T: ContainsOption {
  /// The `<option>` element represents an option in a `<select>` element or as part of a list of suggestions in a datalist element.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func option(_ attribs: [Attribute<Tag.Option>], _ content: String)
    -> ChildOf {
      return .init(el("option", attribs, [.text(content)]))
  }

  /// The `<option>` element represents an option in a `<select>` element or as part of a list of suggestions in a datalist element.
  ///
  /// - Parameter content: Child nodes.
  public static func option(_ content: String) -> ChildOf {
    return option([], content)
  }
}

extension ChildOf where T == Tag.Object {
  /// The `<param>` element defines parameters for plugins invoked by object elements. It does not represent
  /// anything on its own.
  ///
  /// - Parameters:
  ///   - name: Name of parameter.
  ///   - value: Value of parameter.
  public static func param(name: String, value: String) -> ChildOf<Tag.Object> {
    return .init(.element("param", [("name", name), ("value", value)], []))
  }
}

//public static func picture(
//  _ attribs: [Attribute<Tag.Picture>],
//  _ content: [ChildOf<Tag.Picture>],
//  src: String,
//  alt: String,
//  _ imgAttribs: [Attribute<Tag.Img>] = [])
//  -> Node {
//
//    return el("picture", attribs, content.map { $0.rawValue } + [img(src: src, alt: alt, imgAttribs)])
//}

//public static func picture(
//  _ content: [ChildOf<Tag.Picture>],
//  src: String,
//  alt: String,
//  _ imgAttribs: [Attribute<Tag.Img>] = [])
//  -> Node {
//
//    return picture([], content, src: src, alt: alt, imgAttribs)
//}

/// Conforming elements can contain `<source>` elements. Includes `<audio>` and `<video>` elements.
public protocol ContainsSource {}

extension Tag.Audio: ContainsSource {}
extension Tag.Video: ContainsSource {}

extension ChildOf where T: ContainsSource {
  public static func source(
    src: String,
    _ attribs: [Attribute<Tag.Source>] = [],
    _ transparent: [Node] = [])
    -> ChildOf {
      return .init(el("source", [.src(src)] + attribs, []))
  }
}

extension ChildOf where T == Tag.Picture {
  public static func source(srcset: String, _ attribs: [Attribute<Tag.Source>] = [])
    -> ChildOf {
      return .init(el("source", [.srcset(srcset)] + attribs, []))
  }
}

extension ChildOf where T == Tag.Details {
  /// The first `<summary>` child element of a `<details>` element represents a summary, caption, or legend for the rest of the contents of the parent `<details>` element, if any.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func summary(_ attribs: [Attribute<Tag.Summary>], _ content: Node...) -> ChildOf {
    return .init(el("summary", attribs, ...content))
  }

  /// The first `<summary>` child element of a `<details>` element represents a summary, caption, or legend for the rest of the contents of the parent `<details>` element, if any.
  ///
  /// - Parameter content: Child nodes.
  public static func summary(_ content: Node...) -> ChildOf {
    return summary([], ...content)
  }
}

extension ChildOf where T == Tag.Tr {
  /// The `<td>` element represents a data cell in a table.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func td(_ attribs: [Attribute<Tag.Td>], _ content: Node...) -> ChildOf {
    return .init(el("td", attribs, ...content))
  }

  /// The `<td>` element represents a data cell in a table.
  ///
  /// - Parameter content: Child nodes.
  public static func td(_ content: Node...) -> ChildOf {
    return td([], ...content)
  }

  // TODO: "th" can only be within "thead" or the first "tr" of a "table"
  /// The `<th>` element represents a header cell in a table.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func th(_ attribs: [Attribute<Tag.Th>], _ content: Node...) -> ChildOf {
    return .init(el("th", attribs, ...content))
  }

  // TODO: "th" can only be within "thead" or the first "tr" of a "table"
  /// The `<th>` element represents a header cell in a table.
  ///
  /// - Parameter content: Child nodes.
  public static func th(_ content: Node...) -> ChildOf {
    return th([], ...content)
  }
}

/// Conforming elements can contain `<tr>` elements. Includes `<table>`, `<tbody>` and `<thead>` elements.
public protocol ContainsTr {}

extension Tag.Table: ContainsTr {}
extension Tag.Tbody: ContainsTr {}
extension Tag.Thead: ContainsTr {}

extension ChildOf where T: ContainsTr {
  /// The `<tr>` element represents a row of cells in a table.
  ///
  /// - Parameters:
  ///   - attribs: Attributes.
  ///   - content: Child nodes.
  public static func tr<T: ContainsTr>(_ attribs: [Attribute<Tag.Tr>], _ content: ChildOf<Tag.Tr>...) -> ChildOf<T> {
    return .init(el("tr", attribs, (...content).rawValue))
  }

  /// The `<tr>` element represents a row of cells in a table.
  ///
  /// - Parameter content: Child nodes.
  public static func tr<T: ContainsTr>(_ content: ChildOf<Tag.Tr>...) -> ChildOf<T> {
    return tr([], ...content)
  }
}

/// Conforming elements can contain `<track>` elements. Includes `<audio>` and `<video>` elements.
public protocol ContainsTrack {}

extension Tag.Audio: ContainsTrack {}
extension Tag.Video: ContainsTrack {}

extension ChildOf where T: ContainsTrack {
  /// The `<track>` element allows authors to specify explicit external text resources for media elements. It does not represent anything on its own.
  ///
  /// - Parameters:
  ///   - src: The `src` attribute gives the address of the text track data.
  ///   - attribs: Additional attributes.
  public static func track<T: ContainsTrack>(src: String, _ attribs: [Attribute<Tag.Track>] = []) -> ChildOf<T> {
    return .init(el("track", [.src(src)] + attribs, []))
  }
}

private func escape(rawText: String, for tag: String) -> String {
  return rawText.replacingOccurrences(of: "<(/\(tag)[TODO]>)", with: "&lt;/$1>", options: .regularExpression)
}
