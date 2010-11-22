module TargetsHelper
  def target_list(targets)
    return "" if targets.size == 0
    tr = []
    th = []
    th.push(content_tag(:th, "Name"))
    th.push(content_tag(:th, "Target Species"))
    th.push(content_tag(:th, "Antibodies"))
    th.push(content_tag(:th, "Validations"))
    tr.push(content_tag(:tr, th.join("\t").html_safe))
    targets.each do |target|
      td = []
      td.push(content_tag(:td, link_to(target.name, target)))
      td.push(content_tag(:td, link_to(target.species.name, target.species)))
      td.push(content_tag(:td, target.antibodies_count, :class => "number"))
      td.push(content_tag(:td, validation_by_type(target.validations), :class => "number"))
      tr.push(content_tag(:tr, td.join("\n").html_safe))
    end
    content_tag(:h2, "Targets (#{targets.size})") + content_tag(:table, tr.join("\n").html_safe)
  end

  def validation_by_type(validations)
    count = []
    v = validations.group_by(&:category)
    ["Western blot", "Dot blot", "ChIP-chip/seq"].each do |category|
      value = v[category].present? ? v[category].size : 0
      css_class = v[category].present? ? "validation_" + category.first.downcase : "validation_blank"
      count.push(content_tag(:span, value, :class =>css_class, :title => category))
    end
    content_tag(:div, count.join("").html_safe, :class => "validation_categories")
  end
end
