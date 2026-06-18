-- statecraft-callouts.lua
-- Quarto does not recognise the book's custom callout classes for LaTeX, so in
-- the PDF the pedagogical boxes render as plain paragraphs. This filter wraps
-- each into a tcolorbox environment defined in tex/statecraft.tex. PDF only.

local map = {
  ["callout-praksa"]   = "calloutpraksa",
  ["callout-empirija"] = "calloutempirija",
  ["callout-vjezba"]   = "calloutvjezba",
}

function Div(el)
  if not (FORMAT:match("latex") or FORMAT:match("pdf")) then
    return nil
  end
  for _, cls in ipairs(el.classes) do
    local env = map[cls]
    if env then
      local out = pandoc.List({})
      out:insert(pandoc.RawBlock("latex", "\\begin{" .. env .. "}"))
      out:extend(el.content)
      out:insert(pandoc.RawBlock("latex", "\\end{" .. env .. "}"))
      return out
    end
  end
  return nil
end
