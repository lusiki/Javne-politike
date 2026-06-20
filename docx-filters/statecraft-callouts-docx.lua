-- statecraft-callouts-docx.lua
-- The book's custom pedagogical callouts (.callout-praksa/empirija/vjezba) are
-- CSS-styled divs, not native Quarto callouts. In DOCX Quarto drops them to
-- plain content, losing the label the reader relies on. This filter prepends a
-- bold label paragraph and wraps the box in a block quote so it stays visually
-- distinct in Word. DOCX only (mirrors pdf-filters/statecraft-callouts.lua).

local labels = {
  ["callout-praksa"]   = "Politika u praksi",
  ["callout-empirija"] = "Empirijski dokaz",
  ["callout-vjezba"]   = "Vježba s podacima",
}

function Div(el)
  if not FORMAT:match("docx") then
    return nil
  end
  for _, cls in ipairs(el.classes) do
    local label = labels[cls]
    if label then
      local heading = pandoc.Para({ pandoc.Strong(pandoc.Str(label)) })
      local out = pandoc.List({ heading })
      out:extend(el.content)
      return pandoc.BlockQuote(out)
    end
  end
  return nil
end
