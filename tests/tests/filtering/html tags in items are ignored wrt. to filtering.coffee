require('../../testutils.js').plug_macros()

ns = ns_1275

module.exports =

  "Setup": (browser) ->
    browser
      .setupCombo()
      .click(ns + combo_input)

      .setValue(ns+combo_input, "underline")
      .assert.numberOfChildren(ns+"li", 0, "html tags are ignored in search 1")

      .refresh()
      .setValue(ns+combo_input, "<underline>")
      .assert.numberOfChildren(ns+"li", 0, "html tags are ignored in search 2")

      .refresh()
      .setValue(ns+combo_input, "truly")
      .assert.numberOfChildren(ns+"li", 3, "match terms may be inside tags")
      .assert.innerHTML(ns + combo_list + "li:nth-child(1)", "I <underline><em><b>truly</b></em></underline> believe you are special! <strike>#1</strike>")
      .assert.innerHTML(ns + combo_list + "li:nth-child(2)", "I <em><b>truly</b></em> believe you are special! <strike>#2</strike>")
      .assert.innerHTML(ns + combo_list + "li:nth-child(3)", "I <b>truly</b> <em>believe</em> you are special! #3")
      .end()