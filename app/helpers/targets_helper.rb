module TargetsHelper
  def target_list(targets)
    return "" if targets.size == 0
    tr = []
    th = []
    th.push(content_tag(:th, "Name"))
    th.push(content_tag(:th, "Target Species"))
    th.push(content_tag(:th, "Antibodies"))
    th.push(content_tag(:th, "Validated Species"))
    th.push(content_tag(:th, "Validations"))
    th.push(content_tag(:th, "Passed / Total"))
    tr.push(content_tag(:tr, th.join("\t").html_safe))
    targets.each do |target|
      td = []
      td.push(content_tag(:td, link_to(target.name, target)))
      td.push(content_tag(:td, link_to(target.species.name, target.species)))
      td.push(content_tag(:td, target.antibodies_count, :class => "number"))
      td.push(content_tag(:td, validated_species(target.validations)))
      td.push(content_tag(:td, link_to(validation_by_type(target.validations), target)))
      td.push(content_tag(:td, link_to(validation_results(target.validations), target)))
      tr.push(content_tag(:tr, td.join("\n").html_safe))
    end
    content_tag(:h2, "Targets (#{targets.size})") + content_tag(:table, tr.join("\n").html_safe, :class => "targets")
  end

  def validation_by_type(validations)
    count = []
    v = validations.group_by(&:category)
    ["Western blot", "Dot blot", "ChIP-chip/seq"].each do |category|
      value = v[category].present? ? category.first + v[category].size.to_s : 0
      css_class = v[category].present? ? "validation_" + category.first.downcase : "validation_blank"
      count.push(content_tag(:span, value, :class =>css_class, :title => category))
    end
    content_tag(:div, count.join("").html_safe, :class => "validation_categories")
  end

  def validated_species(validations)
    validations.map {|v| v.species}.uniq.compact.sort_by(&:name).map {|s| link_to(s.name, s)}.join("\n").html_safe
  end

  def validation_results(validations)
    v = validations.group_by(&:result)
    "#{v["Passed"].nil? ? 0 : v["Passed"].size} / #{validations.size}"
  end
end
