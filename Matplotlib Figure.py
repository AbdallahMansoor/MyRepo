# to locate the file for the Figure class, you can use: print(matplotlib.figure.__file__)

class Figure(FigureBase):
        
    # some methods inside the Figure class ....
    def __init__(self,
                 figsize=None,
                 dpi=None,
                 *,
                 facecolor=None,
                 edgecolor=None,
                 linewidth=0.0,
                 frameon=None,
                 subplotpars=None,  # rc figure.subplot.*
                 tight_layout=None,  # rc figure.autolayout
                 constrained_layout=None,  # rc figure.constrained_layout.use
                 layout=None,
                 **kwargs
                 ):
        
        # some code in the __init__ method of the Figure ...
        #----------------------------------------------------------        
        self.last_axes = None
        self.press = None
        self.prev_xlim = None
        self.prev_ylim = None
        self.total_dx = 0
        self.total_dy = 0
        self.motion_cid = None
        
        self.canvas.mpl_connect('button_press_event', self.on_button_press)
        self.canvas.mpl_connect('button_release_event', self.on_release)
        self.canvas.mpl_connect('motion_notify_event', self.on_motion)
        self.canvas.mpl_connect('axes_enter_event', self.on_axes_enter)
        self.canvas.mpl_connect('axes_leave_event', self.on_axes_leave)
        self.canvas.mpl_connect('scroll_event', self.on_scroll)
        self.canvas.mpl_connect('key_press_event', self.on_key_press)

        mpl.rcParams["keymap.zoom"]= ['o', 'z']
        # for later, we can use mpl.get_current_fig_manager().toolbar.push_current() to push states on the navigation stack to be able to access with the back and forward keys
        mpl.rcParams["keymap.back"]= ['ctrl+z', 'left']
        mpl.rcParams["keymap.forward"]= ['ctrl+y', 'right', 'ctrl+shift+z']
        # the end of the __init__ method 
        
    def on_button_press(self, event):
        if event.button == 1:
            if event.inaxes is None:
                return
            self.press = event.xdata, event.ydata
            self.prev_xlim = self.last_axes.get_xlim()
            self.prev_ylim = self.last_axes.get_ylim()
            self.motion_cid = self.last_axes.figure.canvas.mpl_connect('motion_notify_event', self.on_motion)
        elif event.button == 2:
            if event.inaxes:
                self.last_axes.relim()
                self.last_axes.autoscale()
                self.last_axes.figure.canvas.draw_idle()
            else:
                for ax in self.last_axes.figure.axes:
                    ax.relim()
                    ax.autoscale()
                    ax.figure.canvas.draw_idle()
                    
    def on_release(self, event):
        if self.motion_cid:
            self.last_axes.figure.canvas.mpl_disconnect(self.motion_cid)
            self.motion_cid = None
        self.press = None
        self.total_dx = 0
        self.total_dy = 0
        
    def on_motion(self, event):
        if self.press is None or event.inaxes is None or self.last_axes is None:
            return
        if self.last_axes.get_navigate_mode() == "ZOOM":
            return
        if event.button == 1:
            dx, dy = event.xdata - self.press[0], event.ydata - self.press[1]
            self.total_dx += dx
            self.total_dy += dy
            new_xlim = self.prev_xlim[0] - self.total_dx, self.prev_xlim[1] - self.total_dx
            new_ylim = self.prev_ylim[0] - self.total_dy, self.prev_ylim[1] - self.total_dy
            self.last_axes.set_xlim(new_xlim)
            self.last_axes.set_ylim(new_ylim)
            if 'ipympl' not in mpl.get_backend():
                self.last_axes.figure.canvas.draw_idle()
            
    def on_axes_enter(self, event):
        self.last_axes = event.inaxes
        self.last_axes.figure.canvas.capture_scroll=True
        
    def on_axes_leave(self, event):
        self.last_axes.figure.canvas.capture_scroll=False
        
    def on_scroll(self, event):
        if event.inaxes is None:
            return
        xlim=self.last_axes.get_xlim()
        ylim=self.last_axes.get_ylim()
        xdata=event.xdata
        ydata=event.ydata
        
        if event.button == 'up':
            scale_factor = 0.9
        elif event.button == 'down':
            scale_factor = 1.1
        else:
            return
        
        new_xlim = [(xlim[0] - xdata) * scale_factor + xdata, (xlim[1] - xdata) * scale_factor + xdata]
        new_ylim = [(ylim[0] - ydata) * scale_factor + ydata, (ylim[1] - ydata) * scale_factor + ydata]
        
        self.last_axes.set_xlim(new_xlim)
        self.last_axes.set_ylim(new_ylim)
        if 'ipympl' not in mpl.get_backend():
                self.last_axes.figure.canvas.draw_idle()
    
    def on_key_press(self, event):
        if event.key == 'd':
            if event.inaxes:
                self.last_axes.relim()
                self.last_axes.autoscale()
                self.last_axes.figure.canvas.draw_idle()
            else:
                for ax in self.last_axes.figure.axes:
                    ax.relim()
                    ax.autoscale()
                    ax.figure.canvas.draw_idle()
                    
     # Other methods inside the Figure class ....

   
