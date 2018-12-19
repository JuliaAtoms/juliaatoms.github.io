using Pkg
Pkg.activate(".")

using Luxor
import Luxor: reds, greens, purples

function juliacircle(n, radius=100; outercircleratio=0.75, innercircleratio=0.65)
    color_sequence = [reds, greens, purples]
    p = Point(0,0)
    setcolor(color_sequence[n][1]...)
    circle(p, outercircleratio * radius, :fill)
    setcolor(color_sequence[n][2]...)
    circle(p, innercircleratio * radius, :fill)
end

function figure_common(fun::Function, w, h, name)
    Drawing(w, h, name)
    origin()
    background(1,1,1,0)
    fun()
    finish()
end

Δx = 100
ΔE = -100
s = 0.3

figure_common(3Δx, abs(2ΔE), "julia-atoms-logo-two-level.svg") do
    @layer begin
        bb = BoundingBox()
        bbs = 0.9bb
        p1 = Point(bbs.corner1.x, bb.corner1.y)
        p2 = Point(bbs.corner2.x, bb.corner2.y)
        bb = BoundingBox(p1,p2)
        translate(0,-ΔE/2)
        setcolor("black")
        rule(Point(0,0), boundingbox=bb)
        rule(Point(0,ΔE), boundingbox=bb)
    end
    @layer begin
        translate(-Δx,-ΔE/2)
        @layer begin
            scale(s)
            juliacircle(1)
        end
        @layer begin
            translate(Δx,0)
            scale(s)
            juliacircle(2)
        end
        @layer begin
            translate(2Δx,ΔE)
            scale(s)
            juliacircle(3)
        end
    end
end

figure_common(3Δx, abs(3ΔE), "julia-atoms-logo-three-level.svg") do
    @layer begin
        translate(0,-ΔE)
        setcolor("black")
        line(Point(-1.4Δx,0),Point(-0.1Δx,0), :stroke)
        line(Point(0.1Δx,1.5ΔE),Point(1.4Δx,1.5ΔE), :stroke)
        line(Point(-1.4Δx,2ΔE),Point(-0.1Δx,2ΔE), :stroke)
    end
    @layer begin
        translate(-Δx,-ΔE)
        @layer begin
            scale(s)
            juliacircle(1)
        end
        @layer begin
            translate(0.5Δx,2ΔE)
            scale(s)
            juliacircle(2)
        end
        @layer begin
            translate(1.5Δx,1.5ΔE)
            scale(s)
            juliacircle(3)
        end
    end
end
