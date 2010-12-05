module TargetsHelper
  def target_list(targets, noheading = nil)
    return "" if targets.size == 0
    tr = []
    th = []
    th.push(content_tag(:th, "Name"))
    th.push(content_tag(:th, "Target Species"))
    th.push(content_tag(:th, "Antibodies"))
    th.push(content_tag(:th, "Validated Species"))
    th.push(content_tag(:th, ("Validations" + validations_help).html_safe))
    th.push(content_tag(:th, ("Passed / Total" + validation_criteria_help).html_safe))
    tr.push(content_tag(:tr, th.join("\n").html_safe))
    targets.each do |target|
      td = []
      td.push(content_tag(:td, link_to(target.name, target)))
      td.push(content_tag(:td, target.species.name))
      td.push(content_tag(:td, target.antibodies_count, :class => "number"))
      td.push(content_tag(:td, validated_species(target.validations)))
      td.push(content_tag(:td, link_to(validation_by_type(target.validations), target)))
      td.push(content_tag(:td, link_to(validation_results(target.validations), target) + validation_results_graph(target.validations)))
      tr.push(content_tag(:tr, td.join("\n").html_safe))
    end
    table = content_tag(:table, tr.join("\n").html_safe, :class => "targets")
    if noheading.nil?
      return content_tag(:h2, "Targets (#{targets.size})") + table
    else
      return table
    end
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
    validations.map {|v| v.species}.uniq.compact.sort_by(&:name).map {|s| s.name}.join(", ").html_safe
  end

  def validation_results(validations)
    v = validations.group_by(&:result)
    passed = v["Passed"].nil? ? 0 : v["Passed"].size
    failed = validations.size - passed
    "#{passed} / #{validations.size}"
  end

  def validation_results_graph(validations)
    v = validations.group_by(&:result)
    passed = v["Passed"].nil? ? 0 : v["Passed"].size
    failed = validations.size - passed
    graph = "http://chart.apis.google.com/chart?chs=36x36&cht=p&chco=008000|EEEEEE&chf=bg,s,FFFFFF00&chp=4.71&chd=t:#{passed},#{failed}"
    image_tag(graph, :class => "validation_results_graph").html_safe
  end

  def validations_help
    help('<div class="validation_categories"><span class="validation_w">W</span>: Western blot validations<br /><span class="validation_d">D</span>: Dot blot validations<br /><span class="validation_c">C</span>: ChIP-chip/seq validataions</div>')
  end

  def validation_criteria_help
    help('<ul><li><strong>Western blot</strong>: Pass if the histone band constituted at least 50% of the total nuclear signal, was at least ten-fold more intense than any other single nuclear band, and was at least ten-fold more intense than recombinant, unmodified histone.</li><li><strong>Dot blot</strong>: Pass if at least 75% of the total signal was specific to the cognate peptide.</li><li><strong>ChIP-chip/seq</strong>:  Pass if the Pearson correlation is more than 0.8 on any pair of ChIPs performed from independent preparations matched for stage, cell type or biological tissue</li></ul>', "criteria")
  end
end
