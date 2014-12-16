var T, baidu = T = baidu || {
    version: "1.3.9"
};
baidu.guid = "$BAIDU$";
window[baidu.guid] = window[baidu.guid] || {};
baidu.dom = baidu.dom || {};
baidu.dom._styleFilter = baidu.dom._styleFilter || [];
baidu.dom._styleFilter[baidu.dom._styleFilter.length] = {
    get: function(c, d) {
        if (/color/i.test(c) && d.indexOf("rgb(") != -1) {
            var e = d.split(",");
            d = "#";
            for (var b = 0,
            a; a = e[b]; b++) {
                a = parseInt(a.replace(/[^\d]/gi, ""), 10).toString(16);
                d += a.length == 1 ? "0" + a: a
            }
            d = d.toUpperCase()
        }
        return d
    }
};
baidu.dom._styleFilter.filter = function(b, e, f) {
    for (var a = 0,
    d = baidu.dom._styleFilter,
    c; c = d[a]; a++) {
        if (c = c[f]) {
            e = c(b, e)
        }
    }
    return e
};
baidu.dom._styleFilter[baidu.dom._styleFilter.length] = {
    set: function(a, b) {
        if (b.constructor == Number && !/zIndex|fontWeight|opacity|zoom|lineHeight/i.test(a)) {
            b = b + "px"
        }
        return b
    }
};
baidu.dom._styleFixer = baidu.dom._styleFixer || {};
baidu.browser = baidu.browser || {};
baidu.browser.ie = baidu.ie = /msie (\d+\.\d+)/i.test(navigator.userAgent) ? (document.documentMode || +RegExp["\x241"]) : undefined;
baidu.browser.firefox = /firefox\/(\d+\.\d+)/i.test(navigator.userAgent) ? +RegExp["\x241"] : undefined;
baidu.dom._styleFixer.display = baidu.browser.ie && baidu.browser.ie < 8 ? {
    set: function(a, b) {
        a = a.style;
        if (b == "inline-block") {
            a.display = "inline";
            a.zoom = 1
        } else {
            a.display = b
        }
    }
}: baidu.browser.firefox && baidu.browser.firefox < 3 ? {
    set: function(a, b) {
        a.style.display = b == "inline-block" ? "-moz-inline-box": b
    }
}: null;
baidu.dom._styleFixer["float"] = baidu.browser.ie ? "styleFloat": "cssFloat";
baidu.dom._styleFixer.opacity = baidu.browser.ie ? {
    get: function(a) {
        var b = a.style.filter;
        return b && b.indexOf("opacity=") >= 0 ? (parseFloat(b.match(/opacity=([^)]*)/)[1]) / 100) + "": "1"
    },
    set: function(a, c) {
        var b = a.style;
        b.filter = (b.filter || "").replace(/alpha\([^\)]*\)/gi, "") + (c == 1 ? "": "alpha(opacity=" + c * 100 + ")");
        b.zoom = 1
    }
}: null;
baidu.dom.g = function(a) {
    if ("string" == typeof a || a instanceof String) {
        return document.getElementById(a)
    } else {
        if (a && a.nodeName && (a.nodeType == 1 || a.nodeType == 9)) {
            return a
        }
    }
    return null
};
baidu.g = baidu.G = baidu.dom.g;
baidu.lang = baidu.lang || {};
baidu.lang.isString = function(a) {
    return "[object String]" == Object.prototype.toString.call(a)
};
baidu.isString = baidu.lang.isString;
baidu.dom._g = function(a) {
    if (baidu.lang.isString(a)) {
        return document.getElementById(a)
    }
    return a
};
baidu._g = baidu.dom._g;
baidu.dom.getDocument = function(a) {
    a = baidu.dom.g(a);
    return a.nodeType == 9 ? a: a.ownerDocument || a.document
};
baidu.dom.getComputedStyle = function(b, a) {
    b = baidu.dom._g(b);
    var d = baidu.dom.getDocument(b),
    c;
    if (d.defaultView && d.defaultView.getComputedStyle) {
        c = d.defaultView.getComputedStyle(b, null);
        if (c) {
            return c[a] || c.getPropertyValue(a)
        }
    }
    return ""
};
baidu.string = baidu.string || {};
baidu.string.toCamelCase = function(a) {
    if (a.indexOf("-") < 0 && a.indexOf("_") < 0) {
        return a
    }
    return a.replace(/[-_][^-_]/g,
    function(b) {
        return b.charAt(1).toUpperCase()
    })
};
baidu.dom.getStyle = function(c, b) {
    var e = baidu.dom;
    c = e.g(c);
    b = baidu.string.toCamelCase(b);
    var d = c.style[b] || (c.currentStyle ? c.currentStyle[b] : "") || e.getComputedStyle(c, b);
    if (!d) {
        var a = e._styleFixer[b];
        if (a) {
            d = a.get ? a.get(c) : baidu.dom.getStyle(c, a)
        }
    }
    if (a = e._styleFilter) {
        d = a.filter(b, d, "get")
    }
    return d
};
baidu.getStyle = baidu.dom.getStyle;
baidu.browser.opera = /opera(\/| )(\d+(\.\d+)?)(.+?(version\/(\d+(\.\d+)?)))?/i.test(navigator.userAgent) ? +(RegExp["\x246"] || RegExp["\x242"]) : undefined;
baidu.dom._styleFixer.textOverflow = (function() {
    var b = {};
    function a(e) {
        var f = e.length;
        if (f > 0) {
            f = e[f - 1];
            e.length--
        } else {
            f = null
        }
        return f
    }
    function c(e, f) {
        e[baidu.browser.firefox ? "textContent": "innerText"] = f
    }
    function d(m, h, s) {
        var k = baidu.browser.ie ? m.currentStyle || m.style: getComputedStyle(m, null),
        r = k.fontWeight,
        q = "font-family:" + k.fontFamily + ";font-size:" + k.fontSize + ";word-spacing:" + k.wordSpacing + ";font-weight:" + ((parseInt(r) || 0) == 401 ? 700 : r) + ";font-style:" + k.fontStyle + ";font-variant:" + k.fontVariant,
        e = b[q];
        if (!e) {
            k = m.appendChild(document.createElement("div"));
            k.style.cssText = "float:left;" + q;
            e = b[q] = [];
            for (var n = 0; n < 256; n++) {
                n == 32 ? (k.innerHTML = "&nbsp;") : c(k, String.fromCharCode(n));
                e[n] = k.offsetWidth
            }
            c(k, "\u4e00");
            e[256] = k.offsetWidth;
            c(k, "\u4e00\u4e00");
            e[257] = k.offsetWidth - e[256] * 2;
            e[258] = e[".".charCodeAt(0)] * 3 + e[257] * 3;
            m.removeChild(k)
        }
        for (var l = m.firstChild,
        p = e[256], g = e[257], f = e[258], u = [], s = s ? f: 0; l; l = l.nextSibling) {
            if (h < s) {
                m.removeChild(l)
            } else {
                if (l.nodeType == 3) {
                    for (var n = 0,
                    t = l.nodeValue,
                    j = t.length; n < j; n++) {
                        k = t.charCodeAt(n);
                        u[u.length] = [h, l, n];
                        h -= (n ? g: 0) + (k < 256 ? e[k] : p);
                        if (h < s) {
                            break
                        }
                    }
                } else {
                    k = l.tagName;
                    if (k == "IMG" || k == "TABLE") {
                        k = l;
                        l = l.previousSibling;
                        m.removeChild(k)
                    } else {
                        u[u.length] = [h, l];
                        h -= l.offsetWidth
                    }
                }
            }
        }
        if (h < s) {
            while (k = a(u)) {
                h = k[0];
                l = k[1];
                k = k[2];
                if (l.nodeType == 3) {
                    if (h >= f) {
                        l.nodeValue = l.nodeValue.substring(0, k) + "...";
                        return true
                    } else {
                        if (!k) {
                            m.removeChild(l)
                        }
                    }
                } else {
                    if (d(l, h, true)) {
                        return true
                    } else {
                        m.removeChild(l)
                    }
                }
            }
            m.innerHTML = ""
        }
    }
    return {
        get: function(g) {
            var f = baidu.browser,
            e = dom.getStyle;
            return (f.opera ? e("OTextOverflow") : f.firefox ? g._baiduOverflow: e("textOverflow")) || "clip"
        },
        set: function(f, h) {
            var e = baidu.browser;
            if (f.tagName == "TD" || f.tagName == "TH" || e.firefox) {
                f._baiduHTML && (f.innerHTML = f._baiduHTML);
                if (h == "ellipsis") {
                    f._baiduHTML = f.innerHTML;
                    var i = document.createElement("div"),
                    g = f.appendChild(i).offsetWidth;
                    f.removeChild(i);
                    d(f, g)
                } else {
                    f._baiduHTML = ""
                }
            }
            i = f.style;
            e.opera ? (i.OTextOverflow = h) : e.firefox ? (f._baiduOverflow = h) : (i.textOverflow = h)
        }
    }
})(); (function() {
    var a = new RegExp("(^[\\s\\t\\xa0\\u3000]+)|([\\u3000\\xa0\\s\\t]+\x24)", "g");
    baidu.string.trim = function(b) {
        return String(b).replace(a, "")
    }
})();
baidu.trim = baidu.string.trim;
baidu.dom.addClass = function(f, g) {
    f = baidu.dom.g(f);
    var b = g.split(/\s+/),
    a = f.className,
    e = " " + a + " ",
    d = 0,
    c = b.length;
    for (; d < c; d++) {
        if (e.indexOf(" " + b[d] + " ") < 0) {
            a += (a ? " ": "") + b[d]
        }
    }
    f.className = a;
    return f
};
baidu.addClass = baidu.dom.addClass;
baidu.dom.contains = function(a, b) {
    var c = baidu.dom._g;
    a = c(a);
    b = c(b);
    return a.contains ? a != b && a.contains(b) : !!(a.compareDocumentPosition(b) & 16)
};
baidu.dom._NAME_ATTRS = (function() {
    var a = {
        cellpadding: "cellPadding",
        cellspacing: "cellSpacing",
        colspan: "colSpan",
        rowspan: "rowSpan",
        valign: "vAlign",
        usemap: "useMap",
        frameborder: "frameBorder"
    };
    if (baidu.browser.ie < 8) {
        a["for"] = "htmlFor";
        a["class"] = "className"
    } else {
        a.htmlFor = "for";
        a.className = "class"
    }
    return a
})();
baidu.dom.setAttr = function(b, a, c) {
    b = baidu.dom.g(b);
    if ("style" == a) {
        b.style.cssText = c
    } else {
        a = baidu.dom._NAME_ATTRS[a] || a;
        b.setAttribute(a, c)
    }
    return b
};
baidu.setAttr = baidu.dom.setAttr;
baidu.dom.setAttrs = function(c, a) {
    c = baidu.dom.g(c);
    for (var b in a) {
        baidu.dom.setAttr(c, b, a[b])
    }
    return c
};
baidu.setAttrs = baidu.dom.setAttrs;
baidu.dom.create = function(c, a) {
    var d = document.createElement(c),
    b = a || {};
    return baidu.dom.setAttrs(d, b)
}; (function() {
    var a = window[baidu.guid];
    baidu.lang.guid = function() {
        return "TANGRAM__" + (a._counter++).toString(36)
    };
    a._counter = a._counter || 1
})();
window[baidu.guid]._instances = window[baidu.guid]._instances || {};
baidu.lang.isFunction = function(a) {
    return "[object Function]" == Object.prototype.toString.call(a)
};
baidu.lang.Class = function(a) {
    this.guid = a || baidu.lang.guid();
    window[baidu.guid]._instances[this.guid] = this
};
window[baidu.guid]._instances = window[baidu.guid]._instances || {};
baidu.lang.Class.prototype.dispose = function() {
    delete window[baidu.guid]._instances[this.guid];
    for (var a in this) {
        if (!baidu.lang.isFunction(this[a])) {
            delete this[a]
        }
    }
    this.disposed = true
};
baidu.lang.Class.prototype.toString = function() {
    return "[object " + (this._className || "Object") + "]"
};
baidu.lang.Event = function(a, b) {
    this.type = a;
    this.returnValue = true;
    this.target = b || null;
    this.currentTarget = null
};
baidu.lang.Class.prototype.addEventListener = function(d, c, b) {
    if (!baidu.lang.isFunction(c)) {
        return
    } ! this.__listeners && (this.__listeners = {});
    var a = this.__listeners,
    e;
    if (typeof b == "string" && b) {
        if (/[^\w\-]/.test(b)) {
            throw ("nonstandard key:" + b)
        } else {
            c.hashCode = b;
            e = b
        }
    }
    d.indexOf("on") != 0 && (d = "on" + d);
    typeof a[d] != "object" && (a[d] = {});
    e = e || baidu.lang.guid();
    c.hashCode = e;
    a[d][e] = c
};
baidu.lang.Class.prototype.removeEventListener = function(d, c) {
    if (typeof c != "undefined") {
        if ((baidu.lang.isFunction(c) && !(c = c.hashCode)) || (!baidu.lang.isString(c))) {
            return
        }
    } ! this.__listeners && (this.__listeners = {});
    d.indexOf("on") != 0 && (d = "on" + d);
    var b = this.__listeners;
    if (!b[d]) {
        return
    }
    if (typeof c != "undefined") {
        b[d][c] && delete b[d][c]
    } else {
        for (var a in b[d]) {
            delete b[d][a]
        }
    }
};
baidu.lang.Class.prototype.dispatchEvent = function(d, a) {
    if (baidu.lang.isString(d)) {
        d = new baidu.lang.Event(d)
    } ! this.__listeners && (this.__listeners = {});
    a = a || {};
    for (var c in a) {
        d[c] = a[c]
    }
    var c, b = this.__listeners,
    e = d.type;
    d.target = d.target || this;
    d.currentTarget = this;
    e.indexOf("on") != 0 && (e = "on" + e);
    baidu.lang.isFunction(this[e]) && this[e].apply(this, arguments);
    if (typeof b[e] == "object") {
        for (c in b[e]) {
            b[e][c].apply(this, arguments)
        }
    }
    return d.returnValue
};
baidu.lang.createSingle = function(b) {
    var d = new baidu.lang.Class();
    for (var a in b) {
        d[a] = b[a]
    }
    return d
};
baidu.dom.ddManager = baidu.lang.createSingle({
    _targetsDroppingOver: {}
});
baidu.event = baidu.event || {};
baidu.event._listeners = baidu.event._listeners || [];
baidu.event.on = function(b, e, g) {
    e = e.replace(/^on/i, "");
    b = baidu.dom._g(b);
    var f = function(i) {
        g.call(b, i)
    },
    a = baidu.event._listeners,
    d = baidu.event._eventFilter,
    h,
    c = e;
    e = e.toLowerCase();
    if (d && d[e]) {
        h = d[e](b, e, f);
        c = h.type;
        f = h.listener
    }
    if (b.addEventListener) {
        b.addEventListener(c, f, false)
    } else {
        if (b.attachEvent) {
            b.attachEvent("on" + c, f)
        }
    }
    a[a.length] = [b, e, g, f, c];
    return b
};
baidu.on = baidu.event.on;
baidu.event.un = function(c, f, b) {
    c = baidu.dom._g(c);
    f = f.replace(/^on/i, "").toLowerCase();
    var i = baidu.event._listeners,
    d = i.length,
    e = !b,
    h, g, a;
    while (d--) {
        h = i[d];
        if (h[1] === f && h[0] === c && (e || h[2] === b)) {
            g = h[4];
            a = h[3];
            if (c.removeEventListener) {
                c.removeEventListener(g, a, false)
            } else {
                if (c.detachEvent) {
                    c.detachEvent("on" + g, a)
                }
            }
            i.splice(d, 1)
        }
    }
    return c
};
baidu.un = baidu.event.un;
baidu.event.preventDefault = function(a) {
    if (a.preventDefault) {
        a.preventDefault()
    } else {
        a.returnValue = false
    }
};
baidu.object = baidu.object || {};
baidu.extend = baidu.object.extend = function(c, a) {
    for (var b in a) {
        if (a.hasOwnProperty(b)) {
            c[b] = a[b]
        }
    }
    return c
};
baidu.page = baidu.page || {};
baidu.page.getScrollTop = function() {
    var a = document;
    return window.pageYOffset || a.documentElement.scrollTop || a.body.scrollTop
};
baidu.page.getScrollLeft = function() {
    var a = document;
    return window.pageXOffset || a.documentElement.scrollLeft || a.body.scrollLeft
}; (function() {
    baidu.page.getMousePosition = function() {
        return {
            x: baidu.page.getScrollLeft() + a.x,
            y: baidu.page.getScrollTop() + a.y
        }
    };
    var a = {
        x: 0,
        y: 0
    };
    baidu.event.on(document, "onmousemove",
    function(b) {
        b = window.event || b;
        a.x = b.clientX;
        a.y = b.clientY
    })
})();
baidu.browser.isWebkit = /webkit/i.test(navigator.userAgent);
baidu.browser.isGecko = /gecko/i.test(navigator.userAgent) && !/like gecko/i.test(navigator.userAgent);
baidu.browser.isStrict = document.compatMode == "CSS1Compat";
baidu.dom.getPosition = function(a) {
    a = baidu.dom.g(a);
    var j = baidu.dom.getDocument(a),
    d = baidu.browser,
    g = baidu.dom.getStyle,
    c = d.isGecko > 0 && j.getBoxObjectFor && g(a, "position") == "absolute" && (a.style.top === "" || a.style.left === ""),
    h = {
        left: 0,
        top: 0
    },
    f = (d.ie && !d.isStrict) ? j.body: j.documentElement,
    k,
    b;
    if (a == f) {
        return h
    }
    if (a.getBoundingClientRect) {
        b = a.getBoundingClientRect();
        h.left = Math.floor(b.left) + Math.max(j.documentElement.scrollLeft, j.body.scrollLeft);
        h.top = Math.floor(b.top) + Math.max(j.documentElement.scrollTop, j.body.scrollTop);
        h.left -= j.documentElement.clientLeft;
        h.top -= j.documentElement.clientTop;
        var i = j.body,
        l = parseInt(g(i, "borderLeftWidth")),
        e = parseInt(g(i, "borderTopWidth"));
        if (d.ie && !d.isStrict) {
            h.left -= isNaN(l) ? 2 : l;
            h.top -= isNaN(e) ? 2 : e
        }
    } else {
        k = a;
        do {
            h.left += k.offsetLeft;
            h.top += k.offsetTop;
            if (d.isWebkit > 0 && g(k, "position") == "fixed") {
                h.left += j.body.scrollLeft;
                h.top += j.body.scrollTop;
                break
            }
            k = k.offsetParent
        } while ( k && k != a );
        if (d.opera > 0 || (d.isWebkit > 0 && g(a, "position") == "absolute")) {
            h.top -= j.body.offsetTop
        }
        k = a.offsetParent;
        while (k && k != j.body) {
            h.left -= k.scrollLeft;
            if (!d.opera || k.tagName != "TR") {
                h.top -= k.scrollTop
            }
            k = k.offsetParent
        }
    }
    return h
}; (function() {
    var m, l, g, e, p, h, q, a, o, f = baidu.lang.isFunction,
    d, j, c;
    baidu.dom.drag = function(s, r) {
        o = a = null;
        if (! (m = baidu.dom.g(s))) {
            return false
        }
        l = baidu.object.extend({
            autoStop: true,
            capture: true,
            interval: 16,
            handler: m
        },
        r);
        j = baidu.dom.getPosition(m.offsetParent);
        c = baidu.dom.getPosition(m);
        if (baidu.getStyle(m, "position") == "absolute") {
            p = c.top - (m.offsetParent == document.body ? 0 : j.top);
            h = c.left - (m.offsetParent == document.body ? 0 : j.left)
        } else {
            p = parseFloat(baidu.getStyle(m, "top")) || -parseFloat(baidu.getStyle(m, "bottom")) || 0;
            h = parseFloat(baidu.getStyle(m, "left")) || -parseFloat(baidu.getStyle(m, "right")) || 0
        }
        if (l.mouseEvent) {
            g = baidu.page.getScrollLeft() + l.mouseEvent.clientX;
            e = baidu.page.getScrollTop() + l.mouseEvent.clientY
        } else {
            var t = baidu.page.getMousePosition();
            g = t.x;
            e = t.y
        }
        l.autoStop && baidu.event.on(l.handler, "mouseup", n);
        l.autoStop && baidu.event.on(window, "mouseup", n);
        baidu.event.on(document, "selectstart", i);
        if (l.capture && l.handler.setCapture) {
            l.handler.setCapture()
        } else {
            if (l.capture && window.captureEvents) {
                window.captureEvents(Event.MOUSEMOVE | Event.MOUSEUP)
            }
        }
        q = document.body.style.MozUserSelect;
        document.body.style.MozUserSelect = "none";
        if (f(l.ondragstart)) {
            l.ondragstart(m, l)
        }
        d = setInterval(b, l.interval);
        return {
            stop: n,
            update: k
        }
    };
    function k(r) {
        baidu.extend(l, r)
    }
    function n() {
        clearInterval(d);
        if (l.capture && l.handler.releaseCapture) {
            l.handler.releaseCapture()
        } else {
            if (l.capture && window.releaseEvents) {
                window.releaseEvents(Event.MOUSEMOVE | Event.MOUSEUP)
            }
        }
        document.body.style.MozUserSelect = q;
        baidu.event.un(document, "selectstart", i);
        l.autoStop && baidu.event.un(l.handler, "mouseup", n);
        l.autoStop && baidu.event.un(window, "mouseup", n);
        if (f(l.ondragend)) {
            l.ondragend(m, l)
        }
    }
    function b(v) {
        var r = l.range,
        u = baidu.page.getMousePosition(),
        s = h + u.x - g,
        t = p + u.y - e;
        if (typeof r == "object" && r && r.length == 4) {
            s = Math.max(r[3], s);
            s = Math.min(r[1] - m.offsetWidth, s);
            t = Math.max(r[0], t);
            t = Math.min(r[2] - m.offsetHeight, t)
        }
        m.style.top = t + "px";
        m.style.left = s + "px";
        if ((a !== s || o !== t) && (a !== null || o !== null)) {
            if (f(l.ondrag)) {
                l.ondrag(m, l)
            }
        }
        a = s;
        o = t
    }
    function i(r) {
        return baidu.event.preventDefault(r, false)
    }
})();
baidu.dom._matchNode = function(a, c, d) {
    a = baidu.dom.g(a);
    for (var b = a[d]; b; b = b[c]) {
        if (b.nodeType == 1) {
            return b
        }
    }
    return null
};
baidu.dom.first = function(a) {
    return baidu.dom._matchNode(a, "nextSibling", "firstChild")
};
baidu.dom.getAttr = function(b, a) {
    b = baidu.dom.g(b);
    if ("style" == a) {
        return b.style.cssText
    }
    a = baidu.dom._NAME_ATTRS[a] || a;
    return b.getAttribute(a)
};
baidu.getAttr = baidu.dom.getAttr;
baidu.dom.getParent = function(a) {
    a = baidu.dom._g(a);
    return a.parentElement || a.parentNode || null
};
baidu.dom.hasClass = function(c, d) {
    c = baidu.dom.g(c);
    var b = baidu.string.trim(d).split(/\s+/),
    a = b.length;
    d = c.className.split(/\s+/).join(" ");
    while (a--) {
        if (! (new RegExp("(^| )" + b[a] + "( |\x24)")).test(d)) {
            return false
        }
    }
    return true
};
baidu.dom.insertHTML = function(d, a, c) {
    d = baidu.dom.g(d);
    var b, e;
    if (d.insertAdjacentHTML && !baidu.browser.opera) {
        d.insertAdjacentHTML(a, c)
    } else {
        b = d.ownerDocument.createRange();
        a = a.toUpperCase();
        if (a == "AFTERBEGIN" || a == "BEFOREEND") {
            b.selectNodeContents(d);
            b.collapse(a == "AFTERBEGIN")
        } else {
            e = a == "BEFOREBEGIN";
            b[e ? "setStartBefore": "setEndAfter"](d);
            b.collapse(e)
        }
        b.insertNode(b.createContextualFragment(c))
    }
    return d
};
baidu.insertHTML = baidu.dom.insertHTML;
baidu.dom.next = function(a) {
    return baidu.dom._matchNode(a, "nextSibling", "nextSibling")
};
baidu.dom.prev = function(a) {
    return baidu.dom._matchNode(a, "previousSibling", "previousSibling")
};
baidu.string.escapeReg = function(a) {
    return String(a).replace(new RegExp("([.*+?^=!:\x24{}()|[\\]/\\\\])", "g"), "\\\x241")
};
baidu.dom.q = function(h, e, b) {
    var j = [],
    d = baidu.string.trim,
    g,
    f,
    a,
    c;
    if (! (h = d(h))) {
        return j
    }
    if ("undefined" == typeof e) {
        e = document
    } else {
        e = baidu.dom.g(e);
        if (!e) {
            return j
        }
    }
    b && (b = d(b).toUpperCase());
    if (e.getElementsByClassName) {
        a = e.getElementsByClassName(h);
        g = a.length;
        for (f = 0; f < g; f++) {
            c = a[f];
            if (b && c.tagName != b) {
                continue
            }
            j[j.length] = c
        }
    } else {
        h = new RegExp("(^|\\s)" + baidu.string.escapeReg(h) + "(\\s|\x24)");
        a = b ? e.getElementsByTagName(b) : (e.all || e.getElementsByTagName("*"));
        g = a.length;
        for (f = 0; f < g; f++) {
            c = a[f];
            h.test(c.className) && (j[j.length] = c)
        }
    }
    return j
};
baidu.q = baidu.Q = baidu.dom.q;
baidu.dom.query = (function() {
    var ai = document;
    ai._Q_rev = 0;
    var p = false;
    var D = function() {
        ai._Q_rev++;
        p = true
    };
    if (ai.addEventListener) {
        ai.addEventListener("DOMNodeInserted", D, false);
        ai.addEventListener("DOMNodeRemoved", D, false)
    }
    var H;
    var X;
    var J = window.ActiveXObject && !ai.addEventListener; (function() {
        var d = ai.createElement("div");
        d.innerHTML = '<a name="d"></a><div id="d"></div>';
        H = d.getElementsByTagName("*")["d"] === d.lastChild;
        d.innerHTML = '<div class="t e"></div><div class="t"></div>';
        d.lastChild.className = "e";
        X = d.getElementsByClassName && d.getElementsByClassName("e").length == 2
    })();
    var S = !!ai.getElementsByName;
    var aa = typeof ai.documentElement.nextElementSibling !== "undefined";
    var h = !!ai.documentElement.children;
    var b = h && !!ai.documentElement.children.tags;
    var N = /(?:\s*([ ~+>,])\s*)?(?:([:.#]?)((?:[\w\u00A1-\uFFFF-]|\\.)+|\*)|\[\s*((?:[\w\u00A1-\uFFFF-]|\\.)+)(?:\s*([~^$|*!]?=)\s*((['"]).*?\7|[^\]]*))?\s*\])/g;
    function a(d) {
        return d.replace(/^\s*|\s*$/, "")
    }
    function I(d, Q) {
        return (Q.kind = d, Q)
    }
    var z = function() {
        var ao;
        var al;
        function Q(ap) {
            var aq = (ap.lastIndex = al, ap.exec(ao));
            return aq && aq.index == al ? (al = ap.lastIndex, aq) : null
        }
        function an(aq) {
            var ap = aq.charAt(0);
            return ap == '"' || ap == "'" ? aq.slice(1, -1) : aq
        }
        function d() {
            throw ["ParseError", ao, al]
        }
        function am() {
            var av, ax, ap = [],
            at = [ap],
            au = [at];
            while (av = Q(N)) {
                if (av[1]) {
                    if (av[1] == ",") {
                        au.push(at = [])
                    }
                    if (ap.length) {
                        at.push(ap = [])
                    }
                    if (av[1] != ",") {
                        ap.comb = av[1]
                    }
                }
                ax = [av[4] || av[3]];
                if (av[6]) {
                    ax.push(an(av[6]))
                }
                ax.kind = av[5] || (av[4] ? "[": av[2] || "T");
                if (ax[0] == "*" && ax.kind != "T") {
                    d()
                }
                if (av[2] == ":") {
                    ax.kind = ":" + av[3];
                    if (ao.charAt(al) == "(") {
                        al++;
                        if (av[3] == "not" || av[3] == "has") {
                            var ar = al;
                            ax[0] = am();
                            ax[1] = ao.slice(ar, al);
                            if (ao.charAt(al) == ")") {
                                al++
                            } else {
                                d()
                            }
                        } else {
                            var aw = ao.indexOf(")", al);
                            if (aw != -1) {
                                ax[0] = a(ao.slice(al, aw));
                                al = aw + 1
                            } else {
                                d()
                            }
                            if (av[3].indexOf("nth") == 0) {
                                var aq = ax[0];
                                aq = (aq == "even" ? "2n": aq == "odd" ? "2n+1": (aq.indexOf("n") == -1 ? "0n": "") + aq.replace(/\s*/g, "")).split("n");
                                ax[0] = !aq[0] ? 1 : Number(aq[0]) | 0;
                                ax[1] = Number(aq[1]) | 0
                            } else {
                                if (av[3] == "contains") {
                                    ax[0] = an(ax[0])
                                }
                            }
                        }
                    }
                }
                ap.push(ax)
            }
            return au
        }
        return function(ap) {
            return (ao = ap, al = 0, ap = am(), Q(/\s*/g), al < ao.length) ? d() : ap
        }
    } ();
    var aj = {
        "#": 9,
        N: S ? 7 : 0,
        ".": X ? 6 : 0,
        T: 5
    };
    var k = {
        "#": 9,
        "=": 9,
        "[": 8,
        N: 9,
        T: 8,
        ".": 5,
        "~=": 3,
        "|=": 3,
        "*=": 3,
        ":not": 6,
        ":has": 1,
        ":contains": 3,
        ":nth-child": 2,
        ":nth-last-child": 2,
        ":first-child": 3,
        ":last-child": 3,
        ":only-child": 3,
        ":not-ex": 7
    };
    var E = {
        id: "#",
        name: "N"
    };
    var ak = function(Q, d) {
        return Q.tR - d.tR
    };
    var W = /:(nth|eq|gt|lt|first|last|even|odd)$/;
    function ah(al) {
        var an, am;
        var Q = al.length;
        while (Q--) {
            var ao = al[Q];
            if (ao.kind == ":html") {
                ao = I("T", "html")
            }
            if (ao.kind == "=") {
                if (E[ao[0]]) {
                    ao = I(E[ao[0]], [ao[1]])
                }
            } else {
                if (ao.kind == "~=" && ao[0] == "className") {
                    ao = I(".", [ao[1]])
                }
            }
            if (ao.kind == "T") {
                if (ao[0] == "*") {
                    ao.kind = "*"
                } else {
                    al.tag = ao
                }
                am = ao[0].toLowerCase()
            } else {
                if (ao.kind == ".") {
                    if (!al.classes) {
                        al.classes = ao
                    } else {
                        al.classes.push(ao[0]);
                        ao.kind = "*"
                    }
                }
            }
            if (ao.kind == ":not" && !((am = ao[0], am.length == 1) && (am = am[0], am.length == 1))) {
                ao.kind = ":not-ex"
            }
            if (W.test(ao.kind)) {
                ao[0] = Number(ao[0]) | 0;
                var d = I(ao.kind, ao.slice(0));
                ao.kind = "*";
                if (!al.allPoses) {
                    al.allPoses = [d]
                } else {
                    al.allPoses.push(d)
                }
            }
            ao.fR = aj[ao.kind] | 0;
            ao.tR = k[ao.kind] | 0;
            if (ao.fR && (!an || ao.fR > an.fR)) {
                an = ao
            }
            al[Q] = ao
        }
        al.sort(ak);
        al.$ = an;
        return al
    }
    function t(an) {
        var al = [];
        var ap = [al];
        var Q = an.length;
        while (Q--) {
            var d = an[Q];
            d = ah(d);
            d.N = "node" + Q;
            if (d.allPoses) {
                if (!an.allPoses) {
                    an.allPoses = []
                }
                an.allPoses.push.apply(an.allPoses, d.allPoses)
            }
            if (d.$ && (!al.fR || d.$.fR > al.fR || (d.$.fR == al.fR && ap.length == 1))) {
                al.fR = d.$.fR;
                al.fI = al.length
            }
            al.push(d);
            if (d.comb == " " && Q && al.fI != null) {
                ap.push(al = []);
                al.fR = 0
            }
            if (Q == an.length - 1 && d.tag) {
                an.tag = d.tag
            }
        }
        for (var am = 0; am < ap.length; am++) {
            al = ap[am];
            var ao = ap[am + 1];
            if (ao != null) {
                if (al.fR > ao.fR || (al.fR == ao.fR && ao.fI != 0)) {
                    ap.splice(am + 1, 1);
                    al.push.apply(al, ao);
                    am--
                } else {
                    al.R = ao[0].N
                }
            } else {
                al.R = "root"
            }
        }
        if (ap[0].fI == null) {
            ap[0].fI = 0;
            ap[0][0].$ = I("*", ["*"])
        }
        return ap
    }
    function K(d, Q) {
        return d.replace(/#\{([^}]+)\}/g,
        function(al, am) {
            return Q[am] == null ? al: Q[am] + ""
        })
    }
    var u = 0;
    var s = "/*^var doc=root.ownerDocument||root;^*/";
    var e = s + "/*^var xhtml=Q._isXHTML(doc);^*/";
    var c = J ? "#{0}.contains(#{1})": "#{0}.compareDocumentPosition(#{1})&16";
    var V = "#{N}._Q_id||(#{N}._Q_id=++qid)";
    var f = {
        "#": 'var #{N}=Q._byId("#{P}", #{R});if(#{N}){#{X}}',
        N: s + 'var #{N}A=doc.getElementsByName("#{P}");for(var #{N}I=0,#{N};#{N}=#{N}A[#{N}I];#{N}I++){if(#{R}===doc||' + K(c, ["#{R}", "#{N}"]) + "){#{X}}}",
        T: 'var #{N}A=#{R}.getElementsByTagName("#{P}");for(var #{N}I=0,#{N};#{N}=#{N}A[#{N}I];#{N}I++){#{X}}',
        ".": 'var #{N}A=#{R}.getElementsByClassName("#{P}");for(var #{N}I=0,#{N};#{N}=#{N}A[#{N}I];#{N}I++){#{X}}',
        "*": 'var #{N}A=#{R}.getElementsByTagName("*");for(var #{N}I=0,#{N};#{N}=#{N}A[#{N}I];#{N}I++){#{X}}',
        "+": aa ? "/*^var #{N};^*/if(#{N}=#{R}.nextElementSibling){#{X}}": "var #{N}=#{R};while(#{N}=#{N}.nextSibling){if(#{N}.nodeType==1){#{X}break;}}",
        "~": aa ? "/*^var #{N}H={};^*/var #{N}=#{R};while(#{N}=#{N}.nextElementSibling){if(#{N}H[" + V + "])break;#{N}H[" + V + "]=1;#{X}}": "/*^var #{N}H={};^*/var #{N}=#{R};while(#{N}=#{N}.nextSibling){if(#{N}.nodeType==1){if(#{N}H[" + V + "])break;#{N}H[" + V + "]=1;#{X}}}",
        ">": "var #{N}A=#{R}.children||#{R}.childNodes;for(var #{N}I=0,#{N};#{N}=#{N}A[#{N}I];#{N}I++){if(#{N}.nodeType==1){#{X}}}",
        ">T": 'var #{N}A=#{R}.children.tags("#{P}");for(var #{N}I=0,#{N};#{N}=#{N}A[#{N}I];#{N}I++){#{X}}'
    };
    var F = "var #{R}V={_:false};NP_#{R}:{P_#{R}:{#{X}break NP_#{R};}#{R}V._=true;#{Y}}";
    var Y = "if(t=#{N}H[" + V + "]){if(t._){break P_#{R};}else{break NP_#{R};}}#{N}H[" + V + "]=#{R}V;#{X}";
    var A = K(Y, {
        X: "if(#{N}!==#{R}){#{X}}"
    });
    var C = "break P_#{R};";
    var w = {
        ">": "/*^var #{N}H={};^*/var #{N}=#{C}.parentNode;" + A,
        " ": "/*^var #{N}H={};^*/var #{N}=#{C};while(#{N}=#{N}.parentNode){" + A + "}",
        "+": aa ? "/*^var #{N}H={};var #{N};^*/if(#{N}=#{C}.previousElementSibling){#{X}}": "/*^var #{N}H={};^*/var #{N}=#{C};while(#{N}=#{N}.previousSibling){#{X}break;}",
        "~": aa ? "/*^var #{N}H={};^*/var #{N}=#{C};while(#{N}=#{N}.previousElementSibling){" + Y + "}": "/*^var #{N}H={};^*/var #{N}=#{C};while(#{N}=#{N}.previousSibling){" + Y + "}"
    };
    var B = "function(root){var result=[];var qid=Q.qid,t,l=result.length;BQ:{#{X}}Q.qid=qid;return result;}";
    var af = "/*^var #{N}L;^*/if(!#{N}L||!(" + K(c, ["#{N}L", "#{N}"]) + ")){#{X}#{N}L=#{N};}";
    var j = "result[l++]=#{N};";
    var ae = e + '/*^var input_t=!xhtml?"INPUT":"input";^*/';
    var U = "/*^var pos=-1;^*/";
    var G = {
        T: e + '/*^var #{N}T=!xhtml?("#{0}").toUpperCase():"#{0}";^*/#{N}.nodeName==#{N}T',
        "#": '#{N}.id=="#{0}"',
        N: '#{N}.name=="#{0}"',
        "[": J ? '(t=#{N}.getAttributeNode("#{0}"))&&(t.specified)': '#{N}.hasAttribute("#{0}")',
        "=": '#{A}=="#{1}"',
        "!=": '#{A}!="#{1}"',
        "^=": '(t=#{A})&&t.slice(0,#{L})=="#{1}"',
        "$=": '(t=#{A})&&t.slice(-#{L})=="#{1}"',
        "*=": '(t=#{A})&&t.indexOf("#{1}")!==-1',
        "|=": '(t=#{A})&&(t=="#{1}"||t.slice(0,#{L})=="#{P}")',
        "~=": '(t=#{A})&&(" "+t+" ").indexOf("#{P}")!==-1',
        ":element": "#{N}.nodeType==1",
        ":contains": '(#{N}.textContent||#{N}.innerText).indexOf("#{0}")!==-1',
        ":first-child": aa ? "#{N}.parentNode.firstElementChild===#{N}": "Q._isFirstChild(#{N})",
        ":nth-child": s + "/*^var rev=doc._Q_rev||(doc._Q_rev=Q.qid++);^*/Q._index(#{N},#{0},#{1},rev)",
        ":last-child": aa ? "#{N}.parentNode.lastElementChild===#{N}": "Q._isLastChild(#{N})",
        ":only-child": aa ? "(t=#{N}.parentNode)&&(t.firstElementChild===#{N}&&t.lastElementChild===#{N})": "Q._isOnlyChild(#{N})",
        ":not-ex": '/*^var _#{G}=Q._hash(Q("#{1}",root));qid=Q.qid;^*/!_#{G}[' + V + "]",
        ":has": '(t=Q("#{1}", #{N}),qid=Q.qid,t.length>0)',
        ":parent": "!!#{N}.firstChild",
        ":empty": "!#{N}.firstChild",
        ":header": "/h\\d/i.test(#{N}.nodeName)",
        ":input": "/input|select|textarea|button/i.test(#{N}.nodeName)",
        ":enabled": '#{N}.disabled===false&&#{N}.type!=="hidden"',
        ":disabled": "#{N}.disabled===true",
        ":checked": "#{N}.checked===true",
        ":selected": "(#{N}.parentNode.selectedIndex,#{N}.selected===true)",
        ":focus": s + "#{N}===doc.activeElement",
        ":button": ae + '#{N}.nodeName==="button"||(#{N}.nodeName===input_t&&#{N}.type==="button")',
        ":submit": ae + '#{N}.nodeName===input_t&&#{N}.type==="submit"',
        ":reset": ae + '#{N}.nodeName===input_t&&#{N}.type==="reset"',
        ":text": ae + '#{N}.nodeName===input_t&&#{N}.type==="text"&&(t=#{N}.getAttribute("type"),t==="text"||t===null)',
        ":radio": ae + '#{N}.nodeName===input_t&&#{N}.type==="radio"',
        ":checkbox": ae + '#{N}.nodeName===input_t&&#{N}.type==="checkbox"',
        ":file": ae + '#{N}.nodeName===input_t&&#{N}.type==="file"',
        ":password": ae + '#{N}.nodeName===input_t&&#{N}.type==="password"',
        ":image": ae + '#{N}.nodeName===input_t&&#{N}.type==="image"'
    };
    function Z(d) {
        if (d == "for") {
            return "#{N}.htmlFor"
        }
        if (d == "class") {
            return "#{N}.className"
        }
        if (d == "type") {
            return '#{N}.getAttribute("type")'
        }
        if (d == "href") {
            return '#{N}.getAttribute("href",2)'
        }
        return '(#{N}["' + d + '"]||#{N}.getAttribute("' + d + '"))'
    }
    function m(am) {
        if (am.kind.indexOf("=") !== -1) {
            am.A = Z(am[0])
        }
        var Q;
        switch (am.kind) {
        case ".":
            var d = am.length;
            var al = [];
            while (d--) {
                al.push('t.indexOf(" #{' + d + '} ")!==-1')
            }
            return K('(t=#{N}.className)&&((t=" "+t+" "),(' + al.join(" && ") + "))", am);
        case "^=":
        case "$=":
            am.L = am[1].length;
            break;
        case "|=":
            am.L = am[1].length + 1;
            am.P = am[1] + "-";
            break;
        case "~=":
            am.P = " " + am[1] + " ";
            break;
        case ":nth-child":
            if (am[0] == 1 && am[1] == 0) {
                return ""
            }
            break;
        case ":not":
            Q = P(am[0][0][0]);
            return Q ? "!(" + Q + ")": "false";
        case ":not-ex":
        case ":has":
            am.G = u++;
            break;
        case "*":
            return ""
        }
        return K(G[am.kind], am)
    }
    function P(Q) {
        var an = [];
        var d = Q.length;
        var al;
        while (d--) {
            var am = Q[d];
            if (al = m(am)) {
                an.push(al)
            }
        }
        return an.join(" && ")
    }
    function M(d) {
        var Q = P(d);
        return Q ? K("if(" + Q + "){#{X}}", {
            N: d.N
        }) : "#{X}"
    }
    var O = {
        "#": 1,
        T: 1,
        ".": 1,
        N: 1,
        ":element": 1
    };
    function ac(d, am, al) {
        al = al || d.comb;
        var Q;
        if (al == " ") {
            var an = d.$;
            if (an) {
                Q = f[an.kind];
                an.kind = "*"
            } else {
                Q = f["*"];
                if (J && !O[d[d.length - 1].kind]) {
                    d.push(I(":element", []))
                }
            }
        } else {
            if (b && al == ">" && d.tag) {
                Q = f[">T"];
                an = d.tag;
                d.tag.kind = "*"
            } else {
                Q = f[al]
            }
        }
        return K(Q, {
            P: an && (an.kind == "." ? an.join(" ") : an[0]),
            N: d.N,
            R: am,
            X: M(d)
        })
    }
    function r(am, Q) {
        var an = "#{X}";
        var al = am.fI;
        while (al--) {
            an = K(an, {
                X: ac(am[al], am[al + 1].N)
            })
        }
        var d;
        if (!Q) {
            if (am.fI == 0 && (al = am[0].$.kind) && (al != "S" && al != "#")) {
                d = K(af, {
                    N: am[0].N
                });
                an = K(an, {
                    X: d
                })
            }
        } else {
            d = K(Q, {
                N: am[0].N
            });
            an = K(an, {
                X: d
            })
        }
        return an
    }
    function i(d, al, Q) {
        return K(w[Q], {
            N: d.N,
            C: al,
            X: M(d)
        })
    }
    function ab(al) {
        var an = F;
        for (var am = al.fI + 1,
        d = al.length; am < d; am++) {
            var Q = al[am];
            var ao = al[am - 1];
            an = K(an, {
                X: i(Q, ao.N, al[am - 1].comb)
            })
        }
        an = K(an, {
            X: C
        });
        an = K(an, {
            R: al.R
        });
        return an
    }
    function y(al, Q) {
        var am = ac(al[al.fI], al.R, " ");
        var d = r(al, Q);
        if (al.fI < al.length - 1) {
            var an = ab(al);
            d = K(an, {
                Y: d
            })
        }
        return K(am, {
            X: d
        })
    }
    function ad(Q) {
        var am = {};
        var d = Q.length;
        while (d--) {
            var ao = Q[d];
            if (ao.kind == ":first") {
                ao = I(":nth", [0])
            } else {
                if (ao.kind == ":last") {
                    am.last = 1
                }
            }
            if (ao.kind == ":lt") {
                am.lt = am.lt === undefined ? ao[0] : Math.min(am.lt, ao[0])
            } else {
                if (ao.kind == ":gt") {
                    am.gt = am.gt === undefined ? ao[0] : Math.max(am.gt, ao[0])
                } else {
                    if (ao.kind == ":eq" || ao.kind == ":nth") {
                        if (am.eq && am.eq !== ao[0]) {
                            am.no = true
                        } else {
                            am.eq = ao[0]
                        }
                    } else {
                        if (ao.kind == ":even" || ao.kind == ":odd") {
                            am[ao.kind.slice(1)] = 1
                        }
                    }
                }
            }
        }
        if ((am.lt != null && am.eq != null && am.eq >= am.lt) || (am.lt != null && am.gt != null && am.lt <= am.gt) || (am.even && am.odd)) {
            am.no = 1
        }
        if (am.no) {
            return "/*^break BQ;^*/"
        }
        var an = [];
        if (am.even) {
            an.push("pos%2===0")
        } else {
            if (am.odd) {
                an.push("pos%2===1")
            }
        }
        var al = am.eq == null ? j: "if(pos===" + am.eq + "){result=[#{N}];break BQ;}";
        if (am.gt != null) {
            an.push("pos>" + am.gt)
        }
        al = an.length ? "if (" + an.join("&&") + "){" + al + "}": al;
        al = am.lt != null ? "if (pos<" + am.lt + "){" + al + "}else break BQ;": al;
        if (am.last) {
            al += "/*$result=result.slice(-1);$*/"
        }
        return al
    }
    function o(am) {
        var ao = t(am);
        var d = am.allPoses ? U + "pos++;" + ad(am.allPoses) : j;
        u = 0;
        var an = "#{X}";
        var Q = ao.length;
        while (Q--) {
            var al = ao[Q];
            an = K(an, {
                X: y(al, Q == 0 ? d: false)
            })
        }
        return an
    }
    var v;
    if (ai.documentElement.sourceIndex) {
        v = function(Q, d) {
            return Q === d ? 0 : Q.sourceIndex - d.sourceIndex
        }
    } else {
        if (ai.compareDocumentPosition) {
            v = function(Q, d) {
                return Q === d ? 0 : d.compareDocumentPosition(Q) & 2 ? -1 : 1
            }
        }
    }
    function l(ap, ao) {
        if (!ap.length) {
            return ap
        }
        ap.sort(v);
        if (ao) {
            return ap
        }
        var am = [ap[0]];
        var an, Q = 0;
        for (var al = 1,
        d = ap.length; al < d; al++) {
            if (am[Q] !== (an = ap[al])) {
                am[++Q] = an
            }
        }
        return am
    }
    function n(ao) {
        var ap = z(ao);
        var ar = {};
        var al = ap.length;
        while (al--) {
            var d = ap[al];
            var Q = o(d);
            if (ar && d.tag && !ar[d.tag[0]]) {
                ar[d.tag[0]] = 1
            } else {
                ar = null
            }
            var an = {};
            var am = [];
            var aq = [];
            Q = Q.replace(/\/\*\^(.*?)\^\*\//g,
            function(at, au) {
                return (an[au] || (an[au] = am.push(au)), "")
            });
            Q = Q.replace(/\/\*\$(.*?)\$\*\//g,
            function(at, au) {
                return (an[au] || (an[au] = aq.push(au)), "")
            });
            Q = K(B, {
                X: am.join("") + Q + aq.join("")
            });
            ap[al] = new Function("Q", "return(" + Q + ")")(g)
        }
        if (ap.length == 1) {
            return ap[0]
        }
        return function(au) {
            var av = ap.length;
            var at = [];
            while (av--) {
                at.push.apply(at, ap[av](au))
            }
            return l(at, ar != null)
        }
    }
    g._hash = function(d) {
        var am = d._Q_hash;
        if (am == null) {
            am = d._Q_hash = {};
            var Q = d.length;
            var an = g.qid;
            while (Q--) {
                var al = d[Q];
                am[al._Q_id || (al._Q_id = ++an)] = 1
            }
            g.qid = an
        }
        return am
    };
    var x = Array.prototype.slice;
    g._toArray1 = function(al) {
        var Q = al.length;
        var d = new Array(Q);
        while (Q--) {
            d[Q] = al[Q]
        }
        return d
    };
    g._toArray = function(Q) {
        try {
            return x.call(Q, 0)
        } catch(d) {}
        return (g._toArray = g._toArray1)(Q)
    };
    function L(Q, d) {
        throw ["NotImpl"]
    }
    var q = {};
    var R = false;
    function ag(ao, d) {
        var an = d.ownerDocument || d;
        var Q;
        if (!an.getElementById) {
            return L(ao, d)
        }
        if (d === an && an.querySelectorAll && !/#/.test(ao)) {
            try {
                return g._toArray(an.querySelectorAll(ao))
            } catch(al) {}
        }
        var am = q[ao] || (q[ao] = n(ao));
        if (!R) {
            R = true;
            if (!p) {
                an._Q_rev = g.qid++
            }
            Q = am(d);
            R = false
        } else {
            Q = am(d)
        }
        return Q
    }
    g.qid = 1;
    g._byId = function(am, d) {
        if (H) {
            return d.getElementsByTagName("*")[am]
        }
        var al = d.ownerDocument || d;
        var Q = al.getElementById(am);
        if (Q && ((d === al) || g.contains(d, Q)) && (!J || (Q.id === am || Q.getAttributeNode("id").nodeValue === am))) {
            return Q
        }
        return null
    };
    g._in = function(d, ao) {
        var an = g._hash(ao);
        var Q = [];
        for (var al = 0; al < d.length; al++) {
            var am = d[al];
            if (an[am._Q_id || (am._Q_id = ++g.qid)]) {
                Q.push(am)
            }
        }
        return Q
    };
    g.matches = function(d, Q) {
        return g(d, null, null, Q)
    };
    g.contains = ai.documentElement.contains ?
    function(Q, d) {
        return Q !== d && Q.contains(d)
    }: function(Q, d) {
        return Q !== d && Q.compareDocumentPosition(d) & 16
    };
    g._has = function(al, d) {
        for (var Q = 0,
        am; am = d[Q++];) {
            if (!g.contains(al, am)) {
                return false
            }
        }
        return true
    };
    g._index = function(al, aq, ap, an) {
        var ar = al.parentNode;
        if (ar._Q_magic !== an) {
            var Q;
            var ao = 1;
            if (aa) {
                Q = ar.firstElementChild;
                while (Q) {
                    Q._Q_index = ao++;
                    Q = Q.nextElementSibling
                }
            } else {
                var d = ar.children || ar.childNodes;
                for (var am = 0; Q = d[am]; am++) {
                    if (Q.nodeType == 1) {
                        Q._Q_index = ao++
                    }
                    Q = Q.nextSibling
                }
            }
            ar._Q_count1 = ao;
            ar._Q_magic = an
        }
        return aq ? (al._Q_index - ap) % aq == 0 : al._Q_index == ap
    };
    g._isOnlyChild = function(d) {
        return g._isFirstChild(d) && g._isLastChild(d)
    };
    g._isFirstChild = function(d) {
        while (d = d.previousSibling) {
            if (d.nodeType == 1) {
                return false
            }
        }
        return true
    };
    g._isLastChild = function(d) {
        while (d = d.nextSibling) {
            if (d.nodeType == 1) {
                return false
            }
        }
        return true
    };
    g._isXHTML = function(d) {
        return d.documentElement.nodeName == "html"
    };
    function g(an, al, d, Q) {
        al = al || ai;
        var am = ag(an, al);
        if (Q) {
            am = g._in(Q, am)
        }
        if (d) {
            am.push.apply(d, am)
        } else {
            d = am
        }
        return d
    }
    return g
})();
baidu.dom.remove = function(a) {
    a = baidu.dom._g(a);
    var b = a.parentNode;
    b && b.removeChild(a)
};
baidu.dom.removeClass = function(f, g) {
    f = baidu.dom.g(f);
    var d = f.className.split(/\s+/),
    h = g.split(/\s+/),
    b,
    a = h.length,
    c,
    e = 0;
    for (; e < a; ++e) {
        for (c = 0, b = d.length; c < b; ++c) {
            if (d[c] == h[e]) {
                d.splice(c, 1);
                break
            }
        }
    }
    f.className = d.join(" ");
    return f
};
baidu.removeClass = baidu.dom.removeClass;
baidu.dom.setStyle = function(c, b, d) {
    var e = baidu.dom,
    a;
    c = e.g(c);
    b = baidu.string.toCamelCase(b);
    if (a = e._styleFilter) {
        d = a.filter(b, d, "set")
    }
    a = e._styleFixer[b]; (a && a.set) ? a.set(c, d) : (c.style[a || b] = d);
    return c
};
baidu.setStyle = baidu.dom.setStyle;
baidu.dom.setStyles = function(b, c) {
    b = baidu.dom.g(b);
    for (var a in c) {
        baidu.dom.setStyle(b, a, c[a])
    }
    return b
};
baidu.setStyles = baidu.dom.setStyles;
baidu.array = baidu.array || {};
baidu.each = baidu.array.forEach = baidu.array.each = function(g, e, b) {
    var d, f, c, a = g.length;
    if ("function" == typeof e) {
        for (c = 0; c < a; c++) {
            f = g[c];
            d = e.call(b || g, f, c);
            if (d === false) {
                break
            }
        }
    }
    return g
};
baidu.object.values = function(d) {
    var a = [],
    c = 0,
    b;
    for (b in d) {
        if (d.hasOwnProperty(b)) {
            a[c++] = d[b]
        }
    }
    return a
};
baidu.lang.isNumber = function(a) {
    return "[object Number]" == Object.prototype.toString.call(a) && isFinite(a)
}; (function() {
    var d = baidu.browser,
    k = {
        keydown: 1,
        keyup: 1,
        keypress: 1
    },
    a = {
        click: 1,
        dblclick: 1,
        mousedown: 1,
        mousemove: 1,
        mouseup: 1,
        mouseover: 1,
        mouseout: 1
    },
    h = {
        abort: 1,
        blur: 1,
        change: 1,
        error: 1,
        focus: 1,
        load: d.ie ? 0 : 1,
        reset: 1,
        resize: 1,
        scroll: 1,
        select: 1,
        submit: 1,
        unload: d.ie ? 0 : 1
    },
    f = {
        scroll: 1,
        resize: 1,
        reset: 1,
        submit: 1,
        change: 1,
        select: 1,
        error: 1,
        abort: 1
    },
    j = {
        KeyEvents: ["bubbles", "cancelable", "view", "ctrlKey", "altKey", "shiftKey", "metaKey", "keyCode", "charCode"],
        MouseEvents: ["bubbles", "cancelable", "view", "detail", "screenX", "screenY", "clientX", "clientY", "ctrlKey", "altKey", "shiftKey", "metaKey", "button", "relatedTarget"],
        HTMLEvents: ["bubbles", "cancelable"],
        UIEvents: ["bubbles", "cancelable", "view", "detail"],
        Events: ["bubbles", "cancelable"]
    };
    baidu.object.extend(f, k);
    baidu.object.extend(f, a);
    function c(q, o) {
        var n = 0,
        m = q.length,
        p = {};
        for (; n < m; n++) {
            p[q[n]] = o[q[n]];
            delete o[q[n]]
        }
        return p
    }
    function e(o, n, m) {
        m = baidu.object.extend({},
        m);
        var p = baidu.object.values(c(j[n], m)),
        q = document.createEvent(n);
        p.unshift(o);
        if ("KeyEvents" == n) {
            q.initKeyEvent.apply(q, p)
        } else {
            if ("MouseEvents" == n) {
                q.initMouseEvent.apply(q, p)
            } else {
                if ("UIEvents" == n) {
                    q.initUIEvent.apply(q, p)
                } else {
                    q.initEvent.apply(q, p)
                }
            }
        }
        baidu.object.extend(q, m);
        return q
    }
    function b(m) {
        var n;
        if (document.createEventObject) {
            n = document.createEventObject();
            baidu.object.extend(n, m)
        }
        return n
    }
    function g(p, m) {
        m = c(j.KeyEvents, m);
        var q;
        if (document.createEvent) {
            try {
                q = e(p, "KeyEvents", m)
            } catch(o) {
                try {
                    q = e(p, "Events", m)
                } catch(n) {
                    q = e(p, "UIEvents", m)
                }
            }
        } else {
            m.keyCode = m.charCode > 0 ? m.charCode: m.keyCode;
            q = b(m)
        }
        return q
    }
    function l(n, m) {
        m = c(j.MouseEvents, m);
        var o;
        if (document.createEvent) {
            o = e(n, "MouseEvents", m);
            if (m.relatedTarget && !o.relatedTarget) {
                if ("mouseout" == n.toLowerCase()) {
                    o.toElement = m.relatedTarget
                } else {
                    if ("mouseover" == n.toLowerCase()) {
                        o.fromElement = m.relatedTarget
                    }
                }
            }
        } else {
            m.button = m.button == 0 ? 1 : m.button == 1 ? 4 : baidu.lang.isNumber(m.button) ? m.button: 0;
            o = b(m)
        }
        return o
    }
    function i(o, m) {
        m.bubbles = f.hasOwnProperty(o);
        m = c(j.HTMLEvents, m);
        var q;
        if (document.createEvent) {
            try {
                q = e(o, "HTMLEvents", m)
            } catch(p) {
                try {
                    q = e(o, "UIEvents", m)
                } catch(n) {
                    q = e(o, "Events", m)
                }
            }
        } else {
            q = b(m)
        }
        return q
    }
    baidu.event.fire = function(n, o, m) {
        var p;
        o = o.replace(/^on/i, "");
        n = baidu.dom._g(n);
        m = baidu.object.extend({
            bubbles: true,
            cancelable: true,
            view: window,
            detail: 1,
            screenX: 0,
            screenY: 0,
            clientX: 0,
            clientY: 0,
            ctrlKey: false,
            altKey: false,
            shiftKey: false,
            metaKey: false,
            keyCode: 0,
            charCode: 0,
            button: 0,
            relatedTarget: null
        },
        m);
        if (k[o]) {
            p = g(o, m)
        } else {
            if (a[o]) {
                p = l(o, m)
            } else {
                if (h[o]) {
                    p = i(o, m)
                } else {
                    throw (new Error(o + " is not support!"))
                }
            }
        }
        if (p) {
            if (n.dispatchEvent) {
                n.dispatchEvent(p)
            } else {
                if (n.fireEvent) {
                    n.fireEvent("on" + o, p)
                }
            }
        }
    }
})();
baidu.page.getHeight = function() {
    var d = document,
    a = d.body,
    c = d.documentElement,
    b = d.compatMode == "BackCompat" ? a: d.documentElement;
    return Math.max(c.scrollHeight, a.scrollHeight, b.clientHeight)
};
baidu.page.getViewHeight = function() {
    var b = document,
    a = b.compatMode == "BackCompat" ? b.body: b.documentElement;
    return a.clientHeight
};
baidu.page.getViewWidth = function() {
    var b = document,
    a = b.compatMode == "BackCompat" ? b.body: b.documentElement;
    return a.clientWidth
};
baidu.url = baidu.url || {};
baidu.url.escapeSymbol = function(a) {
    return String(a).replace(/[#%&+=\/\\\ \\u3000\f\r\n\t]/g,
    function(b) {
        return "%" + (256 + b.charCodeAt()).toString(16).substring(1).toUpperCase()
    })
};
baidu.object.each = function(e, c) {
    var b, a, d;
    if ("function" == typeof c) {
        for (a in e) {
            if (e.hasOwnProperty(a)) {
                d = e[a];
                b = c.call(e, d, a);
                if (b === false) {
                    break
                }
            }
        }
    }
    return e
};
baidu.lang.isArray = function(a) {
    return "[object Array]" == Object.prototype.toString.call(a)
};
baidu.url.jsonToQuery = function(c, e) {
    var a = [],
    d,
    b = e ||
    function(f) {
        return baidu.url.escapeSymbol(f)
    };
    baidu.object.each(c,
    function(g, f) {
        if (baidu.lang.isArray(g)) {
            d = g.length;
            while (d--) {
                a.push(f + "=" + b(g[d], f))
            }
        } else {
            a.push(f + "=" + b(g, f))
        }
    });
    return a.join("&")
};
baidu.lang.isObject = function(a) {
    return "function" == typeof a || !!(a && "object" == typeof a)
};
baidu.isObject = baidu.lang.isObject; (function() {
    var b = function(c) {
        return baidu.lang.isObject(c) && !baidu.lang.isFunction(c)
    };
    function a(g, f, e, d, c) {
        if (f.hasOwnProperty(e)) {
            if (c && b(g[e])) {
                baidu.object.merge(g[e], f[e], {
                    overwrite: d,
                    recursive: c
                })
            } else {
                if (d || !(e in g)) {
                    g[e] = f[e]
                }
            }
        }
    }
    baidu.object.merge = function(h, c, k) {
        var e = 0,
        l = k || {},
        g = l.overwrite,
        j = l.whiteList,
        d = l.recursive,
        f;
        if (j && j.length) {
            f = j.length;
            for (; e < f; ++e) {
                a(h, c, j[e], g, d)
            }
        } else {
            for (e in c) {
                a(h, c, e, g, d)
            }
        }
        return h
    }
})();
baidu.page.getWidth = function() {
    var d = document,
    a = d.body,
    c = d.documentElement,
    b = d.compatMode == "BackCompat" ? a: d.documentElement;
    return Math.max(c.scrollWidth, a.scrollWidth, b.clientWidth)
}; (function() {
    var a = navigator.userAgent;
    baidu.browser.safari = /(\d+\.\d)?(?:\.\d)?\s+safari\/?(\d+\.\d+)?/i.test(a) && !/chrome/i.test(a) ? +(RegExp["\x241"] || RegExp["\x242"]) : undefined
})(); (function() {
    var a = baidu.dom.ready = function() {
        var g = false,
        f = [],
        c;
        if (document.addEventListener) {
            c = function() {
                document.removeEventListener("DOMContentLoaded", c, false);
                d()
            }
        } else {
            if (document.attachEvent) {
                c = function() {
                    if (document.readyState === "complete") {
                        document.detachEvent("onreadystatechange", c);
                        d()
                    }
                }
            }
        }
        function d() {
            if (!d.isReady) {
                d.isReady = true;
                for (var k = 0,
                h = f.length; k < h; k++) {
                    f[k]()
                }
            }
        }
        function b() {
            try {
                document.documentElement.doScroll("left")
            } catch(h) {
                setTimeout(b, 1);
                return
            }
            d()
        }
        function e() {
            if (g) {
                return
            }
            g = true;
            if (document.addEventListener) {
                document.addEventListener("DOMContentLoaded", c, false);
                window.addEventListener("load", d, false)
            } else {
                if (document.attachEvent) {
                    document.attachEvent("onreadystatechange", c);
                    window.attachEvent("onload", d);
                    var h = false;
                    try {
                        h = window.frameElement == null
                    } catch(i) {}
                    if (document.documentElement.doScroll && h) {
                        b()
                    }
                }
            }
        }
        e();
        return function(h) {
            d.isReady ? h() : f.push(h)
        }
    } ();
    a.isReady = false
})();
var BMapGP = window.BMapGP = BMapGP || {};
var JS_MAP = 1,
STATIC_MAP = 2,
IFRAME_MAP = 3; (function() {
    var a = 0;
    var b = BMapGP.GroupPurchase = function(c, f) {
        if (!c || c.length < 1 || !document.getElementById(c)) {
            return
        }
        if (f.pois.length < 1) {
            return
        }
        a++;
        this._instc = a;
        this._opts = {
            zoom: 18,
            type: 1,
            center: "",
            enableRouteSearchBox: false,
            enableRouteInfo: true,
            enableViewDetail: true,
            selectFirstResult: false,
            mapSize: {
                width: 230,
                height: 250
            },
            _bShowRouteInfo: true,
            _bShowRouteSearchBox: true
        };
        this._opts = baidu.object.merge(this._opts, f, {
            overwrite: true
        });
        this._opts.imgUrl = "http://api.map.baidu.com/tuan/v1.0/images/";
        if (!parseInt(this._opts.zoom)) {
            this._opts.zoom = 18
        }
        if (!parseInt(this._opts.type)) {
            this._opts.type = 1
        }
        this._opts.center = new BMap.Point(this._opts.pois[0].lng, this._opts.pois[0].lat);
        if (!this._opts.mapSize || !this._opts.mapSize.width) {
            this._opts.mapSize = {
                width: 190,
                height: 250
            }
        }
        if (!this._opts.enableRouteSearchBox && !this._opts.enableRouteInfo) {
            this._needRouteInfo = false
        } else {
            this._needRouteInfo = true
        }
        this._container = c;
        this._routeDL = [];
        this._isDetail = false;
        this.writeCss();
        var e = this;
        var g = [e._jsMap, e._staticMap];
        this._openOverlay = arguments[2];
        var d = e._opts.type - 1;
        d = d >= 0 ? d: 0;
        d = d == 2 ? 0 : d;
        g[d](e);
        this._getCityCode()
    };
    baidu.object.extend(b.prototype, {
        _jsMap: function(d) {
            baidu.g(d._container).innerHTML = d._getHTML();
            d._mapContainer = baidu.g("bMapGPMap" + a + "");
            var e = new BMap.Map(d._mapContainer);
            var c = new BMap.NavigationControl({
                type: BMAP_NAVIGATION_CONTROL_ZOOM
            });
            d._map = e;
            d.setMapSize(d._opts.mapSize);
            e.addControl(c);
            e.enableScrollWheelZoom();
            e.centerAndZoom(d._opts.center, d._opts.zoom);
            d._showMarkers(d._opts.pois);
            d.showRoute()
        },
        _staticMap: function(e) {
            var g = "bMapGPMap" + a + "";
            baidu.g(e._container).innerHTML = d();
            var f = new BMap.Map(g);
            f.centerAndZoom(e._opts.center, e._opts.zoom);
            var c = new BMap.NavigationControl({
                type: BMAP_NAVIGATION_CONTROL_ZOOM
            });
            f.addControl(c);
            f.enableScrollWheelZoom();
            e._map = f;
            e._mapContainer = g;
            e.setMapSize(e._opts.mapSize);
            e._showMarkers(e._opts.pois);
            e.showRoute();
            function d() {
                var h = [];
                h.push("<div id='bMapGP" + a + "'><div id='bMapGP1pxMap" + a + "' style='width:1px;height:1px;overflow:hidden;*position:relative;'><div style='width:220px;height:250px;' id='" + g + "' ></div></div><div id='bMapGPPNGWrap" + a + "' style='overflow:hidden;'>");
                h.push("\u6b63\u5728\u8f7d\u5165\u56fe\u7247\u4e2d...");
                h.push("</div><div id='bMapGPView" + a + "' class='bMapGPViewBtn'><span>\u67e5\u770b\u5168\u56fe</span></div>");
                h.push('<div id="bMapGPRoute' + a + '" class="bMapGPInfoWrap">\u6b63\u5728\u8f7d\u5165...</div>');
                h.push("</div>");
                return h.join("")
            }
        },
        _loadPNG: function(k) {
            var f = [],
            d = [],
            h = this,
            c;
            for (var e in h._opts.pois) {
                f.push(h._opts.pois[e].lng + "," + h._opts.pois[e].lat);
                d.push("m," + "ABCDEFGHIJKLMOPQRSTUVWXYZ".charAt(e))
            }
            var g = h._map.getViewport(h._opts.pois);
            if (!k) {
                k = g.zoom;
                c = g.center.lng + "," + g.center.lat
            } else {
                c = h._opts.pois[0].lng + "," + h._opts.pois[0].lat
            }
            if (h._opts.pois.length > 1) {
                k = g.zoom;
                c = g.center.lng + "," + g.center.lat
            }
            var l = arguments[1] || h._opts.mapSize;
            var j = {
                center: c,
                zoom: k > 18 ? 18 : k,
                markers: f.join("|"),
                width: l.width,
                height: l.height,
                markerStyles: d.join("|")
            };
            h._pngSrc = "http://api.map.baidu.com/staticimage?" + baidu.url.jsonToQuery(j) + "";
            baidu.g("bMapGPPNGWrap" + a + "").innerHTML = "<img id='bMapGPPNG" + a + "' style='margin:0;padding:0;width:" + l.width + "px;height:" + l.height + "px;' src='" + h._pngSrc + "' alt='\u767e\u5ea6\u56e2\u8d2d\u5730\u56fe'/>"
        },
        _getHTML: function() {
            var c = [];
            c.push('<div id="bMapGP{instanceIndex}">');
            c.push('<div style="width:220px;height:250px;" id="bMapGPMap{instanceIndex}"></div>');
            c.push('<div id="bMapGPView{instanceIndex}" class="bMapGPViewBtn"><span>\u67e5\u770b\u5168\u56fe</span></div>');
            c.push('<div id="bMapGPRoute{instanceIndex}" class="bMapGPInfoWrap">\u6b63\u5728\u8f7d\u5165...');
            c.push("</div></div>");
            var d = /\{([^}]+)\}/g;
            return c.join("").replace(d, a)
        },
        _setWrapperWidth: function(c) {
            var d = this;
            baidu.dom.setStyle("bMapGP" + a + "", "width", c.width);
            baidu.dom.setStyle(d._container, "width", c.width)
        },
        setZoom: function(d) {
            var c = this;
            this._map.centerAndZoom(c._opts.center, parseInt(d, 10));
            this._opts.zoom = d;
            if (c._opts.type == 2) {
                c._loadPNG(d)
            }
        },
        setMapSize: function(c) {
            if (!parseInt(c.width, 10) || !parseInt(c.height, 10)) {
                return
            }
            this._opts.mapSize.width = parseInt(c.width) - 2;
            this._opts.mapSize.height = parseInt(c.height);
            var d = this._opts.mapSize;
            if (baidu.g("bMapGPPNGWrap" + a + "")) {
                baidu.dom.setStyles("bMapGPPNGWrap" + a + "", {
                    width: d.width + "px",
                    height: d.height + "px"
                })
            }
            if (this._opts.type == 2) {
                this._loadPNG(this._opts.zoom)
            }
            baidu.dom.setStyles(this._mapContainer, d);
            baidu.dom.setStyles(this._container, {
                padding: 0,
                border: "solid 1px #C1D3E1",
                background: "#fff"
            });
            this._setWrapperWidth(d);
            this._map.checkResize()
        },
        panTo: function(c) {
            if (c instanceof BMap.Point) {
                this._map.panTo(c)
            }
        },
        _showViewDetail: function(c) {
            var d = baidu.g("bMapGPView" + a + "");
            c ? (d.style.display = "block") : (d.style.display = "none")
        },
        _showMarkers: function(f, e) {
            var l = f.length,
            n = [],
            j = this;
            if (!l) {
                return
            }
            this._markers = [];
            for (var g in f) {
                var d = new BMap.Point(this._opts.pois[g].lng, this._opts.pois[g].lat);
                var h = this._addMarker(d, g);
                n.push(d);
                this._markers.push(h)
            }
            var k = this._map.getViewport(n);
            var c = k.center,
            m = k.zoom;
            if (l == 1) {
                c = this._opts.center;
                m = this._opts.zoom
            }
            this._map.centerAndZoom(c, m)
        },
        showRoute: function() {
            var n = baidu.g("bMapGPRoute" + a + "");
            if (this._calledShowRoute) {
                n.style.display = "block";
                return
            }
            this._calledShowRoute = true;
            var d = this._opts.pois,
            l = this,
            f = [],
            k = 0;
            for (var h = 0; h < d.length; h++) {
                f[h] = {};
                f[h].title = d[h].title;
                f[h].address = d[h].address;
                f[h].tel = d[h].tel;
                if (l._needRouteInfo) {
                    g(new BMap.Point(d[h].lng, d[h].lat), h)
                } else {
                    k++;
                    j()
                }
            }
            function g(i, o) {
                var p = new BMap.LocalSearch(l._map, {
                    pageCapacity: 20
                });
                p.searchNearby(["\u516c\u4ea4", "\u5730\u94c1"], i, 2000);
                p.setSearchCompleteCallback(function(q) {
                    if (q[0].getNumPois() > 0) {
                        var s = c(q[0], i, BMAP_POI_TYPE_BUSSTOP);
                        f[o].busStop = q[0].getPoi(s).title;
                        f[o].busLines = q[0].getPoi(s).address
                    }
                    if (q[1].getNumPois() > 0) {
                        var r = c(q[1], i, BMAP_POI_TYPE_SUBSTOP);
                        if (r >= 0) {
                            var t = q[1].getPoi(r);
                            f[o].subway = t.title;
                            f[o].subwayLines = t.address;
                            var u = l._map.getDistance(i, t.point);
                            if (u > 1000) {
                                e(o, t, i,
                                function() {
                                    k++;
                                    j()
                                })
                            } else {
                                k++;
                                j()
                            }
                        } else {
                            k++;
                            j()
                        }
                    } else {
                        k++;
                        j()
                    }
                })
            }
            function e(p, q, i, r) {
                var o = new BMap.TransitRoute(l._map, {
                    onSearchComplete: function(s) {
                        var u;
                        for (var w = 0; w < s.getNumPlans(); w++) {
                            var x = s.getPlan(w);
                            for (var v = 0; v < x.getNumLines(); v++) {
                                if (x.getNumRoutes() == 2) {
                                    var t = x.getLine(v);
                                    f[p].subwayToEnd = "\u6362\u4e58" + t.title + "\u5728" + t.getGetOffStop().title + "\u4e0b\u8f66";
                                    r && r();
                                    w = s.getNumPlans();
                                    break
                                }
                            }
                        }
                    }
                });
                o.search(q.point, i)
            }
            function j() {
                if (l._opts.pois.length == k) {
                    n.innerHTML = m(f);
                    var i = "bMapGPRoute" + a + "";
                    l._bindRouteInfoEvt(i);
                    l._addHoverToDl(i);
                    if (l._opts.selectFirstResult && l._opts.pois.length > 1) {
                        baidu.event.fire("bMapGPDt0", "click")
                    }
                    l._opts.enableViewDetail ? l._dialog() : l._showViewDetail(false)
                }
            }
            function c(p, o, q) {
                var w = 2000,
                u;
                for (var s = 0; s < p.getCurrentNumPois(); s++) {
                    if (p.getPoi(s).type == q) {
                        var r = p.getPoi(s);
                        var v = l._map.getDistance(o, r.point);
                        if (v < w) {
                            w = v;
                            u = s
                        }
                    }
                }
                return u
            }
            function m(s) {
                var v = [];
                for (var p = 0; p < s.length; p++) {
                    s[p].index = p;
                    var u = [];
                    u.push('<span id="bMapGPICSp' + p + '" class="bMapGPIC" style="background-position: -23px ' + ( - 25 * p) + 'px;"><img src="http://api.map.baidu.com/images/blank.gif"/></span>');
                    u.push('<dl class="bMapGPDL"><dt><a href="javascript:void(0)">{title}</a></dt>');
                    if (!l._opts.pois[p].isBad) {
                        u.push("<dd><strong>\u5730\u5740\uff1a</strong>{address}</dd>");
                        u.push("<dd><strong>\u7535\u8bdd\uff1a</strong>{tel}</dd>");
                        u.push("<dd class='bMapGPDd'>");
                        if (!l._needRouteInfo || (!l._opts._bShowRouteInfo && !l._opts._bShowRouteSearchBox)) {
                            var w = "bMapGPHide"
                        } (s.length == 1) || u.push('<div id="bMapGPDt{index}" class="bMapGPBusSub ' + w + '" href="javascript:void(0)">\u516c\u4ea4\u4fe1\u606f</div>');
                        var r = (s.length > 1) ? "bMapGPHide": "";
                        u.push('<div class="' + r + ' bMapGPRInfo">');
                        if (l._opts.enableRouteInfo) {
                            var x = l._opts._bShowRouteInfo ? "": "bMapGPHide";
                            u.push("<ul class=" + x + ">");
                            if (s[p].subway) {
                                var q = s[p].subwayLines.length > 0 ? "({subwayLines})": "";
                                u.push("<li><strong>\u5730\u94c1\uff1a</strong>{subway}" + q + "");
                                s[p].subwayToEnd && u.push("{subwayToEnd}");
                                s[p].subway && u.push("</li>")
                            }
                            s[p].busStop && u.push("<li><strong>\u516c\u4ea4\uff1a</strong>{busStop}({busLines})</li>");
                            u.push("</ul>")
                        }
                        var o = l._opts._bShowRouteSearchBox ? "": "bMapGPHide";
                        u.push('<div class="bMapGPSearchBox ' + o + '"><!-- \u516c\u4ea4\u9a7e\u8f66\u641c\u7d22\u6846HTML --></div>')
                    }
                    u.push("</div></dd></dl>");
                    var y = u.join("").replace(/\{([^}]+)\}/g,
                    function() {
                        return s[p][arguments[1]]
                    });
                    v.push(y)
                }
                return v.join("")
            }
        },
        hideRoute: function() {
            if (this._calledShowRoute) {
                baidu.g("bMapGPRoute" + a + "").style.display = "none"
            }
        },
        _bindRouteInfoEvt: function(d) {
            var e = this,
            h = [],
            f = {};
            if (e._opts.pois.length == 1) {
                e._insertSearchBox(baidu.q("bMapGPSearchBox", d)[0], 0, "sl");
                return
            }
            var g = baidu.q("bMapGPBusSub", d);
            var c = "bMapGPBusOn";
            baidu.array.each(g,
            function(j, i) {
                baidu.event.on(j, "click",
                function() {
                    baidu.array.each(g,
                    function(o, n) {
                        baidu.dom.removeClass(o, c)
                    });
                    baidu.dom.addClass(j, c);
                    var l = parseInt(j.id.replace("bMapGPDt", ""), 10);
                    var k = baidu.dom.next(j),
                    m = "bMapGPHide";
                    if (f.i >= 0) {
                        if (f.i == l) {
                            if (f.bHide) {
                                baidu.dom.removeClass(f.routeUL, m);
                                baidu.dom.addClass(j, c);
                                f.bHide = false
                            } else {
                                baidu.dom.addClass(f.routeUL, m);
                                baidu.dom.removeClass(j, c);
                                f.bHide = true
                            }
                            return
                        }
                        baidu.q("bMapGPSearchBox", f.routeUL)[0].innerHTML = "";
                        baidu.dom.addClass(f.routeUL, m);
                        baidu.dom.removeClass(k, m);
                        f = {
                            routeUL: k,
                            i: l,
                            bHide: false
                        };
                        e._insertSearchBox(baidu.q("bMapGPSearchBox", k)[0], l, "sl");
                        return
                    }
                    f = {
                        routeUL: k,
                        i: l,
                        bHide: false
                    };
                    baidu.dom.removeClass(k, m);
                    e._insertSearchBox(baidu.q("bMapGPSearchBox", k)[0], l, "sl")
                })
            })
        },
        _addHoverToDl: function(g) {
            var j = {},
            n = [],
            o = this,
            d;
            baidu.array.each(baidu.q("bMapGPDL", g),
            function(t) {
                var r = baidu.dom.prev(t),
                s = r.id.replace("bMapGPICSp", "");
                var i = {
                    dl: t,
                    mk: r,
                    index: s
                };
                n.push(i);
                o._routeDL.push(i);
                e(s);
                baidu.event.on(t, "click",
                function() {
                    k(s)
                })
            });
            for (var l in o._markers) {
                f(l);
                p(l)
            }
            function f(i) {
                o._markers[l].addEventListener("mouseover",
                function() {
                    h(i)
                });
                o._markers[l].addEventListener("mouseout",
                function() {
                    q(i)
                })
            }
            function p(i) {
                o._markers[l].addEventListener("click",
                function() {
                    k(i)
                })
            }
            function e(i) {
                var r = n[i].dl;
                baidu.event.on(r, "mouseover",
                function(s) {
                    if (s.fromElement && !baidu.dom.contains(r, s.fromElement)) {
                        h(i)
                    } else {
                        if (s.target) {
                            h(i)
                        }
                    }
                });
                baidu.event.on(r, "mouseout",
                function(s) {
                    if (s.toElement && !baidu.dom.contains(r, s.toElement)) {
                        q(i)
                    } else {
                        if (s.target) {
                            q(i)
                        }
                    }
                })
            }
            function k(i) {
                if (j.elem) {
                    o._markers[j.lastIndex].isOpen = false;
                    q(j.lastIndex)
                }
                j.elem = n[i].dl;
                j.lastIndex = i;
                j.mk = n[i].mk;
                h(i);
                o._markers[i].isOpen = true
            }
            function h(i) {
                if (o._markers[i].isOpen) {
                    return
                }
                baidu.dom.addClass(n[i].dl, "bMapGPHighlight");
                baidu.dom.setStyle(n[i].mk, "background-position", "-23px " + o._getBGPosition(i, true) + "px");
                c(i)
            }
            function q(i) {
                if (o._markers[i].isOpen) {
                    return
                }
                baidu.dom.removeClass(n[i].dl, "bMapGPHighlight");
                baidu.dom.setStyle(n[i].mk, "background-position", "-23px " + o._getBGPosition(i, false) + "px");
                m(i)
            }
            function c(i) {
                var r = o._markers[i].getIcon();
                r.setImageOffset(new BMap.Size(0, o._getBGPosition(i, true)));
                o._markers[i].setIcon(r);
                o._markers[i].setTop(true)
            }
            function m(i) {
                var r = o._markers[i].getIcon();
                r.setImageOffset(new BMap.Size(0, o._getBGPosition(i, false)));
                o._markers[i].setIcon(r);
                o._markers[i].setTop(false)
            }
        },
        _getBGPosition: function(c, d) {
            return d ? ( - 250 - (c * 25)) : ( - 25 * c)
        },
        setRouteInfoHeight: function(c) {
            if (parseInt(c, 10)) {
                baidu.g("bMapGPRoute" + a + "").style.height = parseInt(c, 10) + "px"
            }
        },
        _dialog: function() {
            var d = this;
			public_pjd = d;

            var c = new this._overlay(d);
			public_pjc = c;
			
            baidu.event.on("bMapGPView" + a + "", "click",
            function() {
                if (d._opts.type != 3) {
                    c.show()
                }
            });
            if (d._openOverlay) {
                baidu.g("bMapGPOClose").style.display = "none";
                c.show()
            }
        },
		_newdialog: function(){
			
          	if (public_pjd._opts.type != 3) {
				public_pjc.show();
			}
		},
        _overlay: function(x) {
            var j = {
                width: x._opts.mapSize.width,
                height: x._opts.mapSize.height
            };
            var k = x._map.getCenter();
            var o = x._map.getZoom();
            var u = {
                width: 820,
                height: 500
            };
            var t = document.createElement("div");
            t.id = "bMapGPOverlay";
            t.style.display = "none";
            var g = baidu.dom.getParent(x._container);
            if (!x._openOverlay) {
                t.onclick = h
            }
            var i = [];
            var p = baidu.g("bMapGP" + a + ""),
            d = baidu.g("bMapGPRoute" + a + ""),
            e = baidu.g("bMapGPMap" + a + "");
            if (x._opts.type == 2) {
                var l = baidu.g("bMapGPPNGWrap" + a + "");
                var n = baidu.g("bMapGP1pxMap" + a + "")
            }
            var v = 32,
            m = 20,
            y = 200;
            var q = "<div id='bMapGPOHeader' style='border solid 1px; height:" + v + "px;line-height:" + v + "px;background:#E0E8F5;position:absolute;left:0;top:0;width:100%;*width:" + (u.width + 280) + "px;display:none;'><span style='padding-left:" + m + "px;font-weight:bold;font-size:14px;color:#5382CA;' >\u67e5\u770b\u8be6\u60c5</span><span id='bMapGPOClose' style='position:absolute;right:9px;top:8px;width:16px;height:16px;background:url(" + x._opts.imgUrl + "tg-box-close.png) 0 0 no-repeat;cursor:pointer;'></span></div>";
            baidu.dom.insertHTML(x._container, "afterBegin", q);
            if (baidu.g("bMapGPOverlay")) {
                baidu.dom.remove("bMapGPOverlay")
            }
            document.body.appendChild(t);
            var r = false;
            baidu.event.on("bMapGPOClose", "click",
            function() {
                h()
            });
            this.show = function() {
                document.body.appendChild(baidu.g(x._container));
                x._isDetail = true;
                t.style.display = "block";
                baidu.g("bMapGPOHeader").style.display = "block";
                baidu.array.each(baidu.dom.q("bMapGPDd"),
                function(B, A) {
                    baidu.dom.addClass(B, "bMapGPHide")
                });
                w();
                x._showViewDetail(false);
                c();
                if (!r) {
                    x._addInfoWinEvt();
                    r = true
                }
                if (x._opts.type == 2) {
                    baidu.dom.setStyles(n, {
                        overflow: "auto",
                        width: u.width + "px",
                        height: u.height + "px"
                    });
                    l.style.display = "none"
                }
                x._map.checkResize();
                if (x._opts.pois.length > 1) {
                    var z = x._map.getViewport(x._opts.pois);
                    x._map.centerAndZoom(z.center, z.zoom)
                } else {
                    x._map.centerAndZoom(x._opts.center, x._opts.zoom)
                }
                baidu.event.on(window, "resize", c);
                baidu.event.on(window, "scroll", c)
            };
            this.hide = function() {
                h()
            };
            function h() {
                baidu.event.un(window, "resize", c);
                baidu.event.un(window, "scroll", c);
                g.appendChild(baidu.g(x._container));
                t.style.display = "none";
                baidu.g("bMapGPOHeader").style.display = "none";
                x._isDetail = false;
                f();
                x._map.closeInfoWindow();
                baidu.array.each(baidu.dom.q("bMapGPDd"),
                function(A, z) {
                    baidu.dom.removeClass(A, "bMapGPHide")
                });
                x._map.checkResize();
                if (x._opts.pois.length > 1) {
                    x._map.centerAndZoom(k, o)
                } else {
                    x._map.centerAndZoom(x._opts.center, x._opts.zoom)
                }
                if (x._opts.type == 2) {
                    x._loadPNG(x._opts.zoom, j)
                }
            }
            function w() {
                var A = [e, p, d, l, n, baidu.g(x._container)];
                for (var z in A) {
                    A[z] && i.push({
                        dom: A[z],
                        style: baidu.dom.getAttr(A[z], "style")
                    })
                }
            }
            function f() {
                x._showViewDetail(true);
                for (var z in i) {
                    i[z] && baidu.dom.setAttr(i[z].dom, "style", i[z].style)
                }
                i.length = []
            }
            function s() {
                t.style.height = baidu.page.getHeight() + "px";
                t.style.width = baidu.page.getWidth() + "px"
            }
            function c() {
                s();
                var E = baidu.g("bMapGPRoute" + a + "");
                var A = u.width;
                var D = u.height;
                var B = A + y + m * 2;
                x.setMapSize(u);
                var C = (baidu.page.getScrollTop() + baidu.page.getViewHeight() / 2) - (D + m * 2 + v) / 2;
                if (C < 0) {
                    C = 0
                }
                var z = (baidu.page.getScrollLeft() + baidu.page.getViewWidth()) / 2 - B / 2;
                if (z < 0) {
                    z = 0
                }
                baidu.dom.setStyles(x._container, {
                    padding: "" + (v + m) + "px " + m + "px " + m + "px " + m + "px",
                    width: "" + B + "px",
                    top: "" + C + "px",
                    left: "" + z + "px",
                    "z-index": "1100",
                    position: "absolute",
                    background: "#fff"
                });
                baidu.setStyles("bMapGPRoute" + a + "", {
                    position: "absolute",
                    left: (A + 40) + "px",
                    top: "" + (v + m) + "px",
                    height: "" + D + "px",
                    "overflow-x": "hidden",
                    "overflow-y": "auto",
                    width: "" + y + "px",
                    "margin-right": "" + m + "px"
                })
            }
        },
        _insertSearchBox: function(k, h, f) {
            if (!this._opts.enableRouteSearchBox && !this._isDetail) {
                return
            }
            var l = this;
            k.innerHTML = c();
            baidu.event.on("bMapGPTabH" + f, "click",
            function(n) {
                var m = n.target || n.srcElement;
                if (m.tagName.toLowerCase() == "span") {
                    g(m.id.replace("bMapGPTabH", ""))
                }
            });
            baidu.event.on("bMapGPBusS" + f, "click",
            function(m) {
                e("bus", "en", "bMapGPTxtS" + f, d()[h])
            });
            baidu.event.on("bMapGPDriveS" + f, "click",
            function(m) {
                e("nav", "en", "bMapGPTxtS" + f, d()[h])
            });
            baidu.event.on("bMapGPBusE" + f, "click",
            function(m) {
                e("bus", "sn", "bMapGPTxtE" + f, d()[h])
            });
            baidu.event.on("bMapGPDriveE" + f, "click",
            function(m) {
                e("nav", "sn", "bMapGPTxtE" + f, d()[h])
            });
            baidu.event.on("bMapGPSRList" + f, "click",
            function(n) {
                var m = n.target || n.srcElement;
                if (m.tagName.toLowerCase() == "a") {
                    j(m.innerHTML, d()[h])
                }
            });
            baidu.event.on("bMapGPSearchRange" + f, "click",
            function(m) {
                j(baidu.g("bMapGPRangekw" + f).value, d()[h])
            });
            baidu.event.on("bMapGPTxtS" + f, "onkeydown",
            function(m) {
                if (m.keyCode == 13) {
                    i(m);
                    e("bus", "en", "bMapGPTxtS" + f, d()[h])
                }
            });
            baidu.event.on("bMapGPTxtE" + f, "onkeydown",
            function(m) {
                if (m.keyCode == 13) {
                    i(m);
                    e("bus", "sn", "bMapGPTxtE" + f, d()[h])
                }
            });
            baidu.event.on("bMapGPRangekw" + f, "onkeydown",
            function(m) {
                if (m.keyCode == 13) {
                    i(m);
                    j(baidu.g("bMapGPRangekw" + f).value, d()[h])
                }
            });
            function i(m) {
                if (m.preventDefault) {
                    m.preventDefault()
                } else {
                    m.returnValue = false
                }
            }
            function c() {
                var m = [];
                m.push('<div class="bMapGPRBox" id="bMapGPRSeachWrap' + f + '">');
                var n = !l._isDetail ? "bMapGPHide": "";
                m.push('<div id="bMapGPTabH' + f + '" class="bMapGPTabHCss"><span id="bMapGPTabH1' + f + '" class="bMapGPTab1 bMapGPHover">\u5230\u8fd9\u53bb</span><span id="bMapGPTabH2' + f + '" class="bMapGPTab2">\u4ece\u8fd9\u51fa\u53d1</span><span id="bMapGPTabH3' + f + '" class="' + n + ' bMapGPTab3">\u5728\u9644\u8fd1\u627e</span></div>');
                m.push('<div id="bMapGPTabC' + f + '" class="bMapGPTabCC">');
                m.push('<div id="bMapGPTabC1' + f + '" class="bMapGPTabDv">');
                m.push("<span>\u8d77\u70b9:</span>");
                m.push('<input type="text" class="bMapGPTxt" id="bMapGPTxtS' + f + '" size="22" maxlength="100" autocomplete="off"/><div class="bMapGPBoxBtnWrap">');
                m.push('<input type="submit" id="bMapGPBusS' + f + '" class="bMapGPRBoxBtn bMapGPRBoxBtnBus" value="\u516c\u4ea4" class="bMapGPRBoxBtn"/>');
                m.push('<input type="button" id="bMapGPDriveS' + f + '" class="bMapGPRBoxBtn" value="\u9a7e\u8f66"/></div></div>');
                m.push('<div id="bMapGPTabC2' + f + '" class="bMapGPHide bMapGPTabDv">');
                m.push("<span>\u7ec8\u70b9:</span>");
                m.push('<input type="text" class="bMapGPTxt" id="bMapGPTxtE' + f + '" size="22" maxlength="100" autocomplete="off"/><div class="bMapGPBoxBtnWrap">');
                m.push('<input type="submit" id="bMapGPBusE' + f + '" class="bMapGPRBoxBtn bMapGPRBoxBtnBus" value="\u516c\u4ea4" class="bMapGPRBoxBtn"/>');
                m.push('<input type="button" id="bMapGPDriveE' + f + '" class="bMapGPRBoxBtn" value="\u9a7e\u8f66" class="bMapGPRBoxBtn"/></div></div>');
                m.push('<div id="bMapGPTabC3' + f + '" class="bMapGPHide bMapGPTabDv">');
                m.push('<div id="bMapGPSRList' + f + '" class="bMapGPSList"><a href="javascript:void(0)" class="first">ATM</a><a href="javascript:void(0)" >\u94f6\u884c</a><a href="javascript:void(0)">\u5bbe\u9986</a><a href="javascript:void(0)" >\u9910\u9986</a><a href="javascript:void(0)">\u516c\u4ea4\u7ad9</a></div><div class="bMapGPBoxOthr"><span>\u5176\u4ed6\uff1a</span><input type="text" id="bMapGPRangekw' + f + '" size="19" style="width:50px;" maxlength="100" autocomplete="off"/> <input type="submit" id="bMapGPSearchRange' + f + '" value="\u641c\u7d22" class="bMapGPRBoxBtn"/></div></div>');
                m.push("</div></div>");
                return m.join("")
            }
            function d() {
                var o = [];
                for (var n = 0; n < l._opts.pois.length; n++) {
                    var m = l._getMecatorByLngLat(new BMap.Point(l._opts.pois[n].lng, l._opts.pois[n].lat));
                    o[n] = {};
                    o[n].cityCode = l._cityCode;
                    o[n].name = l._opts.pois[n].title;
                    o[n].x = m.x;
                    o[n].y = m.y
                }
                return o
            }
            function g(m) {
                baidu.array.each(baidu.dom.query("#bMapGPTabH" + f + " span"),
                function(n) {
                    if (n.id.replace("bMapGPTabH", "") == m) {
                        baidu.dom.addClass(n, "bMapGPHover")
                    } else {
                        baidu.dom.removeClass(n, "bMapGPHover")
                    }
                });
                baidu.array.each(baidu.dom.query("#bMapGPTabC" + f + " .bMapGPTabDv"),
                function(n) {
                    if (n.id.replace("bMapGPTabC", "") == m) {
                        baidu.dom.removeClass(n, "bMapGPHide")
                    } else {
                        baidu.dom.addClass(n, "bMapGPHide")
                    }
                })
            }
            function e(p, u, o, v) {
                var m = v.name,
                s = v.x,
                q = v.y,
                r = v.cityCode;
                if (baidu.g(o).value == "") {
                    return
                }
                var n = [],
                t = "";
                p == "bus" ? n.push("bse") : n.push("nse");
                n.push("&c=" + r);
                n.push("&wd=" + baidu.g(o).value);
                n.push("&isSingle=true");
                u == "en" ? n.push("&t=0") : n.push("&t=1");
                n.push("&name=" + m);
                n.push("&uid=1");
                n.push("&ptx=" + s);
                n.push("&pty=" + q);
                n.push("&poiType=0");
                n.push("&" + u + "=1$$1$$" + s + "," + q + "$$" + m + "$$$$$$");
                t = n.join("");
                n = [];
                n.push(t);
                n.push("&req=" + encodeURIComponent(t));
                t = "http://map.baidu.com/?newmap=1&s=";
                t += encodeURIComponent(n.join(""));
                window.open(t)
            }
            function j(q, u) {
                if (q == "") {
                    return
                }
                if (q == "\u67e5\u627e\u5176\u4ed6\u5173\u952e\u5b57") {
                    baidu.g("circleText").focus();
                    return
                }
                var t = u.x,
                p = u.y,
                s = u.cityCode,
                m = "http://map.baidu.com/?";
                var n, r, o;
                if (!t || !p) {
                    t = map.getCenter().lng;
                    p = map.getCenter().lat
                }
                n = 15;
                r = l._map.getBounds();
                o = r.minX + "," + r.minY + ";" + r.maxX + "," + r.maxY;
                m += "l=" + n + "&c=" + t + "," + p + "&i=-1|-1|-1&s=" + encodeURIComponent("tpl:PoiSearch?nb&ar=(" + l._getBounds() + ")&wd=" + q + "&c=" + s + "&bdtp=0&nb_x=" + t + "&nb_y=" + p + "&l=" + n + "&r=2000") + "&sc=0";
                window.open(m)
            }
        },
        _addMarker: function(f, e) {
            var d = this;
            var c = new BMap.Marker(f, {
                icon: new BMap.Icon(d._opts.imgUrl + "tg-markers.png", new BMap.Size(23, 25), {
                    imageOffset: new BMap.Size(0, -25 * e),
                    infoWindowOffset: new BMap.Size(10, 0)
                })
            });
            this._map.addOverlay(c);
            return c
        },
        _addInfoWinEvt: function() {
            var d = this,
            e = this._markers;
            for (var c in e) { (function(g) {
                    var f = "<div class='bMapGPWin'><div class='bMapGPWinTitle'>" + d._opts.pois[g].title + "</div>";
                    if (!d._opts.pois[g].isBad) {
                        f += "<ul><li>\u5730\u5740\uff1a" + d._opts.pois[g].address + "</li>";
                        f += "<li>\u7535\u8bdd\uff1a" + d._opts.pois[g].tel + "</li></ul>"
                    }
                    f += "<div id='bMapGPWinSearch' class='bMapGPWinBox'></div></div>";
                    var h = new BMap.InfoWindow(f, {
                        width: d._opts.pois[g].isBad ? 250 : 350
                    });
                    if (!d._opts.pois[g].isBad) {
                        h.addEventListener("open",
                        function() {
                            d._insertSearchBox(baidu.g("bMapGPWinSearch"), g, "big")
                        })
                    }
                    e[g].addEventListener("click",
                    function() {
                        d._isDetail && this.openInfoWindow(h)
                    });
                    baidu.event.on(d._routeDL[g].dl, "click",
                    function() {
                        d._isDetail && e[g].openInfoWindow(h)
                    })
                })(c)
            }
        },
        _getMecatorByLngLat: function(c) {
            return this._map.getMapType().getProjection().lngLatToPoint(c)
        },
        _getCityCode: function(e) {
            if (a > 1) {
                return
            }
            var d = this;
            var c = "http://s0.map.baidu.com/?newmap=1&qt=cen&b=" + d._getBounds() + "&l=12&t=" + new Date().getTime() + "";
            this.scriptRequest(c,
            function() {
                try {
                    d._cityCode = _mapCenter.current_city.code
                } catch(f) {
                    d._cityCode = 131
                } finally {
                    e && e()
                }
            })
        },
        _getBounds: function() {
            var e = this._map.getBounds();
            var d = this._getMecatorByLngLat(e.getSouthWest());
            var c = this._getMecatorByLngLat(e.getNorthEast());
            var f = d.x + "," + d.y + ";" + c.x + "," + c.y;
            return f
        },
        _sendStatCode: function() {
            this.scriptRequest("http://api.map.baidu.com/tuan/v1.0/images/bg.gif?code=123")
        },
        writeCss: function() {
            if (a > 1) {
                return
            }
            var e = this;
            var d = baidu.dom.create("style", {
                type: "text/css"
            });
            if (d.styleSheet) {
                d.styleSheet.cssText = c()
            } else {
                d.appendChild(document.createTextNode(c()))
            }
            document.getElementsByTagName("head")[0].appendChild(d);
            function c() {
                var g = [],
                f = "#" + baidu.g(e._container).id,
                h = e._opts.imgUrl;
                g.push(f + " *{margin:0;padding:0;}");
                g.push(f + " {background:#fff;font-size:12px;font-family:'Arial,sans-serif,\u5b8b\u4f53'}");
                g.push(f + " .bMapGPBig{z-index:10000;position:relative;}");
                g.push(f + " .bMapGPHide{display:none;}");
                g.push(f + " .bMapGPHover{font-weight:bold;}");
                g.push(f + " .bMapGPIC{background:url('" + h + "tg-markers.png');    width:19px;height:25px; cursor:pointer;float:left;display:block;}");
                g.push(f + " .bMapGPFL{float:left;}");
                g.push(f + " ul{list-style:none;margin:5px 0;}");
                g.push(f + " .bMapGPViewBtn{border:solid 1px #C0CED9; border-width:1px 0;text-align:center;color:#268BD9;height:28px;line-height:28px;cursor:pointer;font-size:14px;font-weight:bold;margin-bottom:10px;background:url('" + h + "bg.gif') repeat-x 0 0;}");
                g.push(f + " .bMapGPViewBtn span{padding-left:30px;background:url('" + h + "bg.gif') no-repeat 0 -46px;}");
                g.push(f + " .bMapGPBusSub{cursor:pointer;color:#268BD9;background:url('" + h + "bg.gif') no-repeat 55px -158px;padding:0 20px 3px 0;}");
                g.push(f + " .bMapGPBusSub.bMapGPBusOn{cursor:pointer;color:#268BD9;background:url('" + h + "bg.gif') no-repeat 55px -135px;padding:0 20px 3px 0;border-bottom:dotted 1px #767676}");
                g.push(f + " .bMapGPDL {margin:0 0 10px 24px;cursor:pointer; padding:2px 5px;}");
                g.push(f + " .bMapGPDL dd{line-height:20px;}");
                g.push(f + " .bMapGPDL dt{margin:3px 0;}");
                g.push(f + " .bMapGPDL dt a{color:#3085C8;font-size:14px;font-weight:bold;}");
                g.push(f + " .bMapGPDL li{line-height:22px;color:#767676;}");
                g.push(f + " .bMapGPDL li strong{color:#8c8c8c;font-weight:bold;}");
                g.push(f + " .bMapGPTabDv{margin-top:10px;}");
                g.push(f + " .bMapGPTabDv a{margin-left:10px;}");
                g.push(f + " .bMapGPTabHCss {border-bottom:solid 1px #C7D1DA;}");
                g.push(f + " .bMapGPTabHCss span{background:url('" + h + "bg.gif') repeat-x 0px -74px;border:solid 1px #C7D1DA;border-bottom:none;cursor:pointer;padding:5px 10px 3px 15px;margin-right:10px;}");
                g.push(f + " .bMapGPTabHCss span.bMapGPHover{background:url('" + h + "bg.gif') repeat-x 0px -110px;color:#3085C8;}");
                g.push(f + " .bMapGPSearchBox{padding-top:10px;}");
                g.push(f + " .bMapGPWinBox{*overflow:hidden}");
                g.push(f + " .bMapGPWinBox .bMapGPTabHCss{border:none}");
                g.push(f + " .bMapGPWinBox .bMapGPTabDv{line-height:20px;height:20px;_height:25px;_overflow:hidden;}");
                g.push(f + " .bMapGPWinBox .bMapGPTabHCss span{background:none;text-decoration:none;border:none;padding:2px 10px 2px 0;color:#261CDC;border-right:1px solid #CCCCCC;height:17px;line-height:17px;text-align:center;text-decoration:underline;}");
                g.push(f + " .bMapGPWinBox .bMapGPTabHCss span.bMapGPTab3{border:none}");
                g.push(f + " .bMapGPWinBox .bMapGPTabHCss span.bMapGPHover{background:none;color:#636363;text-decoration:none;font-weight:700;}");
                g.push(f + " .bMapGPWinBox .bMapGPBoxBtnWrap{position:relative;right:10px;float:right;*top:-20px;}");
                g.push(f + " .bMapGPWinBox .bMapGPSList a {text-decoration:underline;color:#261CDC;padding-right:7px;margin:0;float:left;}");
                g.push(f + " .bMapGPWinBox .bMapGPRBox .bMapGPRBoxBtn{margin:0;}");
                g.push(f + " .bMapGPWinBox .bMapGPSList{height:20px;line-height:20px;float:left;}");
                g.push(f + " .bMapGPWinBox .bMapGPBoxOthr{float:left;height:20px;line-height:20px;*position:relative;*top:-5px;}");
                g.push(f + " .bMapGPWinBox .bMapGPBoxOthr .bMapGPRBoxBtn{*top:2px;*position:relative;}");
                g.push(f + " .bMapGPRBox .bMapGPRBoxBtn{margin-top:5px;color:#868686;width:60px;font-weight:bold;}");
                g.push(f + " .bMapGPRBox .bMapGPRBoxBtn.bMapGPRBoxBtnBus{margin-right:8px;}");
                g.push(f + " .bMapGPTxt{width:105px;border:1px solid #A5ACB2}");
                g.push(f + " .bMapGPWinBox .bMapGPTxt{width:163px;margin-left:5px;}");
                g.push(f + " .bMapGPHighlight{background:#F0F0F0;}");
                g.push(f + " .bMapGPInfoWrap{overflow-y:auto;overflow-x:hide;padding:0 7px;background:#fff;}");
                g.push(f + " .bMapGPWinTitle{font-weight:bold;color:#CC5522;font-size:14px;}");
                g.push("#bMapGPOverlay{background:#000;opacity:0.5;filter:alpha(opacity='50');display:none;top:0;left:0;width:100%;height:100%;z-index:1000;cursor:pointer;cursor:hand;position:absolute;}");
                return g.join("")
            }
        },
        scriptRequest: function(d, e) {
            var c = document.createElement("script");
            c.setAttribute("src", d);
            c.setAttribute("type", "text/javascript");
            c.setAttribute("charset", "gbk");
            if (c.addEventListener) {
                c.addEventListener("load",
                function(g) {
                    var f = g.target;
                    f.parentNode.removeChild(f);
                    if (e) {
                        e()
                    }
                },
                false)
            } else {
                if (c.attachEvent) {
                    c.attachEvent("onreadystatechange",
                    function(g) {
                        var f = window.event.srcElement;
                        if (f && (f.readyState == "loaded" || f.readyState == "complete")) {
                            f.parentNode.removeChild(f);
                            if (e) {
                                e()
                            }
                        }
                    })
                }
            }
            setTimeout(function() {
                document.getElementsByTagName("head")[0].appendChild(c);
                c = null
            },
            1)
        }
    });
    BMapGP.stat = function(e, j) {
        if (!e) {
            return
        }
        j = j || {};
        var h = "";
        for (var f in j) {
            h = h + "&" + f + "=" + encodeURIComponent(j[f])
        }
        var d = document.getElementById("statImg");
        if (!d) {
            d = document.createElement("img");
            d.id = "statImg";
            d.style.display = "none";
            document.body.appendChild(d)
        }
        var k = function(i) {
            if (!i) {
                return
            }
            BMapGP.stat._sending = true;
            setTimeout(function() {
                document.getElementById("statImg").src = e + "?" + i.src
            },
            100)
        };
        var c = function() {
            k(BMapGP.stat._reqQueue.shift())
        };
        var g = (Math.random() * 100000000).toFixed(0);
        if (BMapGP.stat._sending) {
            BMapGP.stat._reqQueue.push({
                src: "t=" + g + h
            })
        } else {
            k({
                src: "t=" + g + h
            })
        }
        if (!BMapGP.stat._binded) {
            document.getElementById("statImg").onload = function() {
                BMapGP.stat._sending = false;
                c()
            };
            document.getElementById("statImg").onerror = function() {
                BMapGP.stat._sending = false;
                c()
            };
            BMapGP.stat._binded = true
        }
    };
    BMapGP.stat._reqQueue = [];
    baidu.dom.ready(function() {
        BMapGP.stat("http://api.map.baidu.com/images/blank.gif", {
            code: 1201
        })
    })
})();