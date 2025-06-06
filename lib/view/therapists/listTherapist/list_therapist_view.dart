import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/model/therapist/therapist.dart';
import 'package:physio_digital/view/therapists/listTherapist/list_therapist_controller.dart';
import 'package:physio_digital/repository/therapist_repository.dart';
import 'package:physio_digital/view/therapists/therapist_details.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TherapistView extends StatelessWidget {
  const TherapistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListAllTherapistsController>(
      init: ListAllTherapistsController(Get.find<TherapistRepository>()),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8F9FF),
          body: RefreshIndicator(
            color: const Color(0xFF354AD9),
            onRefresh: controller.refreshTherapists,
            child: Obx(() {
              if (controller.isLoading.value) {
                return _buildShimmerList();
              } else if (controller.errorMessage.isNotEmpty) {
                return _buildErrorState(controller.errorMessage.value);
              } else if (controller.therapists.isEmpty) {
                return _buildEmptyState();
              } else {
                return _buildTherapistList(controller.therapists);
              }
            }),
          ),
        );
      },
    );
  }

  Widget _buildShimmerList() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (_, __) => const ShimmerTherapistCard(),
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 16),
          Text(
            'Something went wrong',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Get.find<ListAllTherapistsController>().refreshTherapists();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF354AD9),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(
              'Try Again',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people_outline_rounded,
            size: 80,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 16),
          Text(
            'No Therapists Available',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Check back later for updates',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTherapistList(List<Therapist> therapists) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: therapists.length,
      itemBuilder: (context, index) {
        final therapist = therapists[index];
        return TherapistCard(therapist: therapist);
      },
    );
  }
}

class ShimmerTherapistCard extends StatelessWidget {
  const ShimmerTherapistCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 14,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 150,
                      height: 12,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 60,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TherapistCard extends StatelessWidget {
  final Therapist therapist;

  const TherapistCard({
    Key? key,
    required this.therapist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to therapist profile screen
        Get.to(() => const TherapistProfileScreen());
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              _buildTherapistAvatar(),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      therapist.name ?? 'Unknown',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      therapist.education ?? 'Physiotherapist',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    _buildServicesTags(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTherapistAvatar() {
    return AnimatedTherapistAvatar(
      imageUrl: therapist.images.isNotEmpty ? therapist.images.first : null,
      name: therapist.name ?? 'Unknown',
    );
  }

  Widget _buildServicesTags() {
    // Example specialties - in real app, get these from the therapist model
    final specialties = ['Sports', 'Rehab'];

    return Row(
      children: specialties.map((specialty) {
        return Container(
          margin: const EdgeInsets.only(right: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF0FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            specialty,
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF354AD9),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class AnimatedTherapistAvatar extends StatefulWidget {
  final String? imageUrl;
  final String name;

  const AnimatedTherapistAvatar({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

  @override
  State<AnimatedTherapistAvatar> createState() => _AnimatedTherapistAvatarState();
}

class _AnimatedTherapistAvatarState extends State<AnimatedTherapistAvatar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;
  late Animation<double> _rotateAnimation;
  bool _isLoaded = false;
  bool _didStartLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _pulseAnimation = Tween<double>(begin: 0.97, end: 1.03).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _rotateAnimation = Tween<double>(begin: -0.01, end: 0.01).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.repeat(reverse: true);

    // Don't call precacheImage here, move it to didChangeDependencies
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Only start loading once to avoid duplicate requests
    if (!_didStartLoading && widget.imageUrl != null) {
      _didStartLoading = true;

      // Pre-load image and handle loaded state correctly
      precacheImage(CachedNetworkImageProvider(widget.imageUrl!), context).then((_) {
        if (mounted) {
          setState(() {
            _isLoaded = true;
            _controller.stop();
          });
        }
      }).catchError((_) {
        // Handle error silently
      });

      // Fallback in case precaching doesn't trigger
      Future.delayed(const Duration(milliseconds: 3000), () {
        if (mounted && _controller.isAnimating) {
          setState(() {
            _isLoaded = true;
            _controller.stop();
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getAvatarColor() {
    // Generate a consistent color based on name
    int hashCode = widget.name.hashCode;
    final colors = [
      const Color(0xFF7986CB), // Indigo
      const Color(0xFF64B5F6), // Blue
      const Color(0xFF4FC3F7), // Light Blue
      const Color(0xFF4DD0E1), // Cyan
      const Color(0xFF4DB6AC), // Teal
      const Color(0xFF81C784), // Green
    ];
    return colors[hashCode.abs() % colors.length];
  }

  String _getInitials() {
    final nameParts = widget.name.split(" ");
    if (nameParts.length > 1) {
      return "${nameParts[0][0]}${nameParts[1][0]}".toUpperCase();
    }
    return nameParts[0].substring(0, nameParts[0].length > 1 ? 2 : 1).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add tap effect
        if (_isLoaded && !_controller.isAnimating) {
          _controller.reset();
          _controller.forward().then((_) {
            if (mounted) {
              _controller.reverse();
            }
          });
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _controller.isAnimating ? _pulseAnimation.value : 1.0,
            child: Transform.rotate(
              angle: _controller.isAnimating ? _rotateAnimation.value : 0.0,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), // Square with rounded corners
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF354AD9),
                      const Color(0xFF354AD9).withOpacity(0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF354AD9).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(3), // Border width
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13), // Inner radius
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Content radius
                      child: _buildAvatarContent(),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAvatarContent() {
    if (widget.imageUrl == null) {
      return _buildDefaultAvatar();
    }

    return CachedNetworkImage(
      imageUrl: widget.imageUrl!,
      fit: BoxFit.cover,
      placeholder: (context, url) => _buildLoadingAvatar(),
      errorWidget: (context, url, error) => _buildDefaultAvatar(),
    );
  }

  Widget _buildLoadingAvatar() {
    return Container(
      color: const Color(0xFFEEF0FF),
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(const Color(0xFF354AD9).withOpacity(0.5)),
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    final color = _getAvatarColor();
    final initials = _getInitials();

    return Container(
      color: color,
      child: Center(
        child: Text(
          initials,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}